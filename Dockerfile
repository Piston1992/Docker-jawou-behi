FROM node as builder 
WORKDIR '/app'
COPY ./package.json ./
RUN npm install	
COPY . .
RUN npm run build 

FROM nginx 
EXPOSE 3000
COPY ./nginx/defaumt.conf etc/ngnix/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
