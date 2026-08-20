FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Đặt dưới buddha/ để khớp path Traefik route xuống, xem nginx.conf.
COPY web/ /usr/share/nginx/html/buddha/

# Manifest npm không cần trong image: MediaPipe được nạp qua CDN, không có bước build.
RUN rm -f /usr/share/nginx/html/buddha/package.json \
          /usr/share/nginx/html/buddha/package-lock.json

EXPOSE 8080
