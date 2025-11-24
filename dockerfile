FROM nginx:1.21.1
COPY index.html /usr/share/nginx/html/index.html
RUN apt-get update
RUN apt-get install nginx
