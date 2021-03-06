#!/bin/sh

[ -z "$POSTGRES_USER" ] && POSTGRES_USER=activiti
[ -z "$POSTGRES_PASSWORD" ] && POSTGRES_PASSWORD=password
[ -z "$POSTGRES_HOST" ] && POSTGRES_HOST=activiti
[ -z "$POSTGRES_DB" ] && POSTGRES_DB=activiti

echo "starting activiti with the following params"
echo "postgres user: $POSTGRES_USER"
echo "postgres password: *******"
echo "postgres host: $POSTGRES_HOST"
echo "postgres db: $POSTGRES_DB"

sed -i "s#POSTGRES_USER#${POSTGRES_USER}#g" /usr/local/tomcat/lib/activiti-app.properties
sed -i "s#POSTGRES_PASSWORD#${POSTGRES_PASSWORD}#g" /usr/local/tomcat/lib/activiti-app.properties
sed -i "s#POSTGRES_HOST#${POSTGRES_HOST}#g" /usr/local/tomcat/lib/activiti-app.properties
sed -i "s#POSTGRES_DB#${POSTGRES_DB}#g" /usr/local/tomcat/lib/activiti-app.properties

/set-activiti-config.sh
/set-activiti-identity-config.sh
/usr/local/tomcat/bin/catalina.sh run
