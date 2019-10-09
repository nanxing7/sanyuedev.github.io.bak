---
title: 从 0 配置一个 Hexo 博客站点
date: 2019-09-24 03:56:14
categories:
- Hexo
---
## 流程
以下内容仅为记录自己搭建配置博客的流程，仅供参考！

参考 [Hexo 官方文档](https://hexo.io)
### 安装
安装 Hexo 只需要几分钟的时间
#### 安装前提
Node.js
Git
#### 安装 Nodejs
```
brew install node
```
#### 安装 Git
```
brew install git
```

#### 安装 Hexo
所有必备的应用程序安装完成后，即可使用 NPM 安装 Hexo
```shell
$ npm install -g hexo-cli
```

### 建站
安装 Hexo 完成后，请执行下列命令，Hexo 将会在指定文件夹中新建所需要的文件。
```shell
$ hexo init <folder>
$ cd <folder>
$ npm install
```
#### 喜闻乐见的配置参数环节
有个坑，就是语言现在变成了 cn-ZH,不再是 zh-Hans,请注意

### 用到的 git 相关命令
```git
git checkout -f hexo #创建并切换到 hexo 分支，hexo 分支存放 Hexo 源文件
git add . #增加变化的文件进 git
git commit -m '描述' #提交所有更改，并注释
git push origin hexo #提交分支 hexo 到远程仓库
```

### .travis.yml 配置代码
```yml
sudo: false
language: node_js
node_js:
  - 10 # use nodejs v10 LTS
cache: npm
branches:
  only:
    - hexo # build master branch only
script:
  - npm install hexo-generator-search --save # 安装本地搜索插件
  - npm audit fix # 执行修复命令
  - hexo generate # generate static files
deploy:
  provider: pages
  skip-cleanup: true
  github-token: $GH_TOKEN #这是一个变量，不要动它，这个变量代表着从 github 设置到的 token
  keep-history: true
  on:
    branch: hexo
  local-dir: public
  target_branch: master

```