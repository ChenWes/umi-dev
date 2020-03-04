FROM node:10.16.0 as webpackNode

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN npm install
#处理参数
ARG REACT_APP_HOST_IP_ADDRESS
#处理这个应用
ENV REACT_APP_HOST_IP_ADDRESS $REACT_APP_HOST_IP_ADDRESS

RUN npm run build




FROM nginx
COPY --from=webpackNode /usr/src/app/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]