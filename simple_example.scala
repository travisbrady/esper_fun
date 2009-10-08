import java.util.{Random, Date, LinkedHashMap}
import java.lang.{String, Double, System}
import com.espertech.esper.client

class Listener extends client.UpdateListener {
    override def update(newData :Array[client.EventBean], oldData :Array[client.EventBean]) {
        val evb = newData(0)
        printf("Symbol: %s Price: %5.2f  Ts: %s\n", evb.get("symbol"),
            evb.get("price"), evb.get("ts"))
    }
}

object SimpleExample {

    val gen = new Random()
    def random_tick() = {
        val hmm = new LinkedHashMap[String, Object]()
        hmm.put("symbol", "AAPL")
        val p = new Double(gen.nextInt(18))
        hmm.put("price", p)
        hmm.put("ts", new Date(System.currentTimeMillis()))
        hmm
    }

    def main(args: Array[String]) {
        var type_map = new LinkedHashMap[String, Object]()
        type_map.put("symbol", classOf[String])
        type_map.put("price", classOf[Double])
        type_map.put("ts", classOf[Date])
        val conf = new client.Configuration()
        conf.addEventType("StockTick", type_map)
        val cep = client.EPServiceProviderManager.getProvider("myCEPEngine", conf)
        val cepRT = cep.getEPRuntime()
        val cepAdm = cep.getEPAdministrator()
        val stmt ="SELECT * FROM StockTick(symbol='AAPL').win:length(10) having avg(price) > 10.0"
        val cepStatement = cepAdm.createEPL(stmt)
        val h = new Listener()
        cepStatement.addListener(h)
        for (i <- 0 to 100) {
            var t = random_tick()
            cepRT.sendEvent(t, "StockTick")
        }
    }
}
SimpleExample.main(null)
