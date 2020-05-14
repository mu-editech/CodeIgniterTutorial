# 参考：https://coroccu.com/codeigniter-nginx-with-docker/
git clone https://github.com/coroccu/codeigniter-nginx-with-docker.git
rm -rf codeigniter-nginx-with-docker/.git
git init
git add -A
git commit -m "initial commit"

# チュートリアル第一章を行う：http://codeigniter.jp/user_guide/3/tutorial/static_pages.html
git checkout -b "chapter1"
cd codeigniter-nginx-with-docker/
docker-compose up -d
# 確認にブラウザでlocalhost:8080へアクセスしてみると、CodeIgniterのデフォのWelcomeページが見える。

# chapter1の修正を全部反映したあと、以下のアドレスへブラウザでアクセスすると、HOMEやABOUTページがみれる。
# localhost:8080/index.php/
# localhost:8080/index.php/about/