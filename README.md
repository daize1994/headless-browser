# headless-browser

## 背景
1. 基础镜像: https://github.com/browserless/chrome
2. 原镜像基于chrome headless模式和puppeteer api，提供了一个nodeJS服务并暴露restful接口，可以实现远程执行浏览器功能，如：渲染pdf，截图等等。

## 介绍
1. 本镜像基于基础镜像，略微修改了Dockerfile，主要使用导出pdf功能

## 做了如下修改：
 1. 安装黑体字体
 2. 修改默认node服务端口为8080
 
## 使用：
1. 构建：`docker build -t my/headless-browser .`
2. 运行：`docker run --name headless -p 8080:8080 -d my/headless-browser`
3. 测试：浏览器打开 [http://localhost:8080](http://localhost:8080)，出现debug页面即可
4. [渲染pdf](https://docs.browserless.io/docs/pdf.html)：
```
curl -X POST \
  https://localhost:8080/pdf \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{
    "url": "https://www.baidu.com",
    "gotoOptions": {
      "waitUntil": "networkidle2"
    },
    "options": {
      "displayHeaderFooter": false,
      "printBackground": true,
      "format": "A3"
    }
}'
```
## 其它：
更多功能请参考原始文档：https://docs.browserless.io/docs/start.html
