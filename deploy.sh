#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
yarn
yarn build

# 进入生成的文件夹
cd docs/.vuepress/dist
echo 'quasar.doc.sikacode.com' > CNAME  # 自定义域名
# Deploy to GitHub
if [ -z "$GITHUB_TOKEN" ]; then
  msg='deploy'
  githubUrl=git@github.com:dq-open-cloud/quasar-sika-design-doc.git
else
  msg='来自GitHub Action的自动部署'
  githubUrl=https://dq-open-cloud:${GITHUB_TOKEN}@github.com/dq-open-cloud/quasar-sika-design-doc.git
  git config --global user.name "dq-open-cloud"
  git config --global user.email "466608943@qq.com"
fi
git init
git add -A
git commit -m "${msg}：$(TZ="Asia/Shanghai" date +"%Y-%m-%d %T %Z")"
git push -f $githubUrl main:gh-pages # 推送到github

cd -