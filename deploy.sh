set -e
npm install
git add .
git commit -m 'Update documents.'
git push
npm run build
cd docs/.vuepress/dist
echo 'quasar.doc.sikacode.com' > CNAME  # 自定义域名
git init -b main
git config user.name 'dq-open-cloud'
git config user.email '466608943@qq.com'
git add -A
git commit -m "deploy: $(TZ="Asia/Shanghai" date +"%Y-%m-%d %T %Z")"
git push -f git@github.com:dq-open-cloud/quasar-sika-design-doc.git main:gh-pages
cd -