FROM node:alpine as build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# путь взят со страницы nginx https://hub.docker.com/_/nginx
COPY --from=build /app/build /usr/share/nginx/html
