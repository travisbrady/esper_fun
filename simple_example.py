# Simple Jython example inspired by:
# http://coffeeonesugar.wordpress.com/2009/07/21/getting-started-with-esper-in-5-minutes/
from java.util import Random, Date, LinkedHashMap
from java.lang import String, Double, System
import com.espertech.esper.client as C

type_map = LinkedHashMap()
type_map.put("symbol", String)
type_map.put("price", Double)
type_map.put("ts", Date)

gen = Random()

def random_tick():
    hmm = LinkedHashMap()
    hmm.put("symbol", 'AAPL')
    p = Double(gen.nextInt(18))
    hmm.put("price", p)
    hmm.put("ts", Date(System.currentTimeMillis()))
    return hmm

class Listener(C.UpdateListener):
    def update(*args, **kwargs):
        a = args[1][0]
        print "Symbol: %s Price: %5.2f  Ts: %s" % (a.get("symbol"),
            a.get("price"), a.get("ts"))

def main():
    conf = C.Configuration()
    conf.addEventType("StockTick", type_map)
    cep = C.EPServiceProviderManager.getProvider("myCEPEngine", conf)
    cepRT = cep.getEPRuntime()
    cepAdm = cep.getEPAdministrator()
    stmt ="SELECT * FROM StockTick(symbol='AAPL').win:length(10) having avg(price) > 10.0"
    cepStatement = cepAdm.createEPL(stmt)
    h = Listener()
    cepStatement.addListener(h)
    for i in range(100):
        t = random_tick()
        cepRT.sendEvent(t, "StockTick")

if __name__ == '__main__':
    main()
