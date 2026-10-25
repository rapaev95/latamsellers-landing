FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY pt/index.html /usr/share/nginx/html/pt/index.html
EXPOSE 80
# absolute_redirect off: /pt → /pt/ redirects to a relative path. With it on,
# nginx would put its internal $PORT into the Location header behind Railway.
CMD sed -i "s/80/$PORT/g" /etc/nginx/conf.d/default.conf && sed -i "s/server_name  localhost;/server_name  localhost; absolute_redirect off;/" /etc/nginx/conf.d/default.conf && nginx -g "daemon off;"
