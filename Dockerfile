FROM node:alpine as builder

WORKDIR /usr/app/

COPY package.json .

RUN npm i 

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /usr/app/build/ /usr/share/nginx/html


#1001712dc914