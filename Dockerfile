# https://hub.docker.com/r/browserless/chrome/
FROM browserless/chrome:1-chrome-stable

# 安装黑体，基础镜像中默认的中文字体(谷歌自己的Noto CJK字体)对部分中文渲染不够美观（例如“门”字）
# 先切换成root用户，避免系统命令无权限
USER root
RUN apt-get update && apt-get install -y fonts-wqy-zenhei
# 字体安装完后切换成原镜像中的默认用户，避免权限过大
USER blessuser

# add env.dev to overwrite origin file, modify the server port
# 只修改了端口号，原镜像默认是3000，改成了8080
ADD .env.dev /usr/src/app

ENV PORT=8080

EXPOSE 8080