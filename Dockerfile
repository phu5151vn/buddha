FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY web/ /usr/share/nginx/html/

# Manifest npm không cần trong image: MediaPipe được nạp qua CDN, không có bước build.
RUN rm -f /usr/share/nginx/html/package.json /usr/share/nginx/html/package-lock.json

EXPOSE 8080
