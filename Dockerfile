FROM node:18.16.0

# 设置时区
ENV TZ=Asia/Shanghai \
  DEBIAN_FRONTEND=noninteractive

# 创建工作目录
RUN mkdir /app
# 指定工作目录
WORKDIR /app
#复制package到工作目录
COPY package*.json ./
#设置npm下载源
RUN npm config set registry https://registry.npm.taobao.org/
#install
RUN npm install


# 复制当前所有代码到/app工作目录
COPY . .
RUN cd /app && rm -rf /app/dist &&  npm run build

#暴露端口3000（与服务启动端口一致）
EXPOSE 3000


# 启动服务
CMD [ "npm", "run", "start:prod" ]
