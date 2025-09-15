# 使用官方 Node.js 运行时作为基础镜像
FROM node:lts

# 安装 pnpm
RUN npm install -g pnpm

# 设置容器内的工作目录
WORKDIR /app

# 从 GitHub 拉取 presentation-ai 项目的代码
# 注意：这里假设仓库是公开的，如果是私有仓库需要处理认证
RUN apt-get update && apt-get install -y git vim postgresql postgresql-contrib
RUN git clone https://github.com/allweonedev/presentation-ai.git .

# 安装项目依赖
RUN pnpm install

# 后续如果需要运行应用，可以暴露端口或定义启动命令
# EXPOSE 3000
# CMD ["pnpm", "start"]
