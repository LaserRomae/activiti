FROM alfresco/process-services:1.11.1.1

COPY src/scripts/entrypoint.sh /root
COPY src/config/activiti-app.properties  /root

RUN chmod 755 /root/entrypoint.sh
