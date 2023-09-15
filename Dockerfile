FROM --platform=linux/amd64 nginx

COPY nginx.conf /etc/nginx/conf.d/default.conf
