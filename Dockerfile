# FROM node:10.16.0 as webpackNode
# WORKDIR /usr/src/app
# COPY . /usr/src/app

# #处理参数（）
# ARG REACT_APP_HOST_IP_ADDRESS
# #处理这个应用
# ENV REACT_APP_HOST_IP_ADDRESS $REACT_APP_HOST_IP_ADDRESS

# RUN npm install
# RUN npm run build




# FROM nginx
# COPY --from=webpackNode /usr/src/app/dist /usr/share/nginx/html
# CMD ["nginx", "-g", "daemon off;"]



# FROM node:10.16.0

# WORKDIR /usr/src/app

# COPY ./package.json /app

# RUN npm install -g umi

# RUN npm install

# COPY . /usr/src/app

# CMD ["npm", "start"]


# step 1. 从docker获取node镜像
FROM node:alpine as webpackNode


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app


RUN apk update && apk upgrade && apk add --no-cache git


COPY . /usr/src/app
RUN yarn install --ignore-engines


CMD [ "yarn start" ]