#CATALINA_OPTS="-server -d64 -Xmx${MAXMEM} -Xms${MINMEM} -Dfile.encoding=UTF-8 -XX:SoftRefLRUPolicyMSPerMB=60000 -Duser.timezone=GMT --XX:+UseParNewGC"
JAVA_OPTS="-server -d64 -Xmx${MAXMEM} -Xms${MINMEM} -Dfile.encoding=UTF-8 -XX:SoftRefLRUPolicyMSPerMB=60000 -Duser.timezone=GMT -XX:MaxPermSize=128m" #--XX:+UseParNewGC"
