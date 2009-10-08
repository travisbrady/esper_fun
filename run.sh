#Set this to where you dropped Esper, yeah I know this is really hacky
# I'm just learning here CUT A GUY A FREAKIN BREAK
ESPER_LOCATION=~/dl/esper-3.2.0
JYTHON=~/jython2.5.1/jython
CLASSPATH=$ESPER_LOCATION/esper/lib/antlr-runtime-3.1.1.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esper/lib/cglib-nodep-2.2.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esper/lib/commons-logging-1.1.1.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esper/lib/log4j-1.2.15.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esper-3.2.0.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/activation-1.1.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/activemq-core-4.1.1.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/axiom-api-1.2.5.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/axiom-dom-1.2.5.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/axiom-impl-1.2.5.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/backport-util-concurrent.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/cglib-nodep-2.2.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/commons-beanutils-1.7.0.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/commons-logging-1.1.1.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/commons-pool-1.3.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/geronimo-j2ee-management_1.0_spec-1.0.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/jaxen-1.1-beta-9.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/jms.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/spring-2.0.5.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/stax-api-1.0.1.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/wstx-asl-3.0.0.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/xbean-spring-2.8.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio/lib/xml-apis-1.3.03.jar:$CLASSPATH
CLASSPATH=$ESPER_LOCATION/esperio-3.2.0.jar:$CLASSPATH
export CLASSPATH

$JYTHON simple_example.py
