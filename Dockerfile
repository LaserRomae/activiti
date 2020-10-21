FROM alfresco/process-services:1.11.1.1

RUN mv /root/*.sh / 
COPY src/scripts/entrypoint.sh /
COPY src/config/activiti-app.properties /usr/local/tomcat/lib/activiti-app.properties
COPY src/config/whitelisted-scripts.conf /usr/local/tomcat/webapps/activiti-app/WEB-INF/classes/activiti/whitelisted-scripts.conf
RUN chmod 755 /*.sh && ls -l /

RUN chgrp -R 0 /usr/local/tomcat
RUN chmod -R g+rwX /usr/local/tomcat
RUN find /usr/local/tomcat -type d -exec chmod g+x {} +

WORKDIR /usr/local/tomcat

USER 1001

ENTRYPOINT ["/entrypoint.sh"]
