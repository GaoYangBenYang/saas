FROM golang:alpine as builder

# 为我们的镜像设置必要的环境变量
ENV GO111MODULE=on \
#禁用cgo
    CGO_ENABLED=0 \
#GOOS指的是目标操作系统，支持以下操作系统
    GOOS=linux \
#GOARCH指的是目标处理器的架构，支持一下处理器架构
    GOARCH=amd64 \
	GOPROXY="https://goproxy.cn,direct"
	
# 移动到工作目录：/home/ubuntu/LearningWall 这个目录 是你项目代码 放在linux上  
# 这是我的代码跟目录 
# 你们得修改成自己的
WORKDIR /home/saas

# 将代码复制到容器中
COPY . .

# 将我们的代码编译成二进制可执行文件  可执行文件名为 main
RUN go build main.go

FROM scratch as prod

WORKDIR /home/

# --from=0 指对应阶段  从0开始
COPY --from=0 /home/saas/ .

# 声明服务端口
EXPOSE 8080

# 启动容器时运行的命令
CMD ["/home/main"]