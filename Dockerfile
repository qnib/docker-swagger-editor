###### Docker image
FROM qnib/alpn-node

ENV SWAGGER_VER=2.10.1
RUN npm install -g http-server \
 && wget -qO /tmp/swagger-editor.zip https://github.com/swagger-api/swagger-editor/releases/download/v${SWAGGER_VER}/swagger-editor.zip \
 && cd /opt/ \
 && unzip /tmp/swagger-editor.zip \
 && rm -f /tmp/swagger-editor.zip
ADD etc/supervisord.d/swagger-editor.ini /etc/supervisord.d/
ADD opt/swagger-editor/spec-files/ /opt/swagger-editor/spec-files/
