FROM areeb2512/k8-custom-base
WORKDIR /app
RUN pwd
RUN ls
RUN ls /usr/share/nginx
RUN npm cache clean --force
COPY . .
RUN npm install
RUN npm run build
RUN ls /app/dist
COPY /app/dist /usr/share/nginx/html
EXPOSE 80 443
