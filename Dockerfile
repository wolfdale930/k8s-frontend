FROM areeb2512/k8-custom-base
WORKDIR /app
RUN npm cache clean --force
COPY . .
RUN npm install
RUN npm run build
COPY /app/dist /usr/share/nginx/html
EXPOSE 80 443
