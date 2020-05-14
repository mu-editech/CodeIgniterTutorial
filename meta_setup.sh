# 参考：https://coroccu.com/codeigniter-nginx-with-docker/
git clone https://github.com/coroccu/codeigniter-nginx-with-docker.git
rm -rf codeigniter-nginx-with-docker/.git
git init
git add -A
git commit -m "initial commit"

# --------------------------------------------------------
# チュートリアル第一章を行う：http://codeigniter.jp/user_guide/3/tutorial/static_pages.html
# --------------------------------------------------------
git checkout -b "chapter1"
cd codeigniter-nginx-with-docker/
docker-compose up -d
# 確認にブラウザでlocalhost:8080へアクセスしてみると、CodeIgniterのデフォのWelcomeページが見える。

# chapter1の修正を全部反映したあと、以下のアドレスへブラウザでアクセスすると、HOMEやABOUTページがみれる。
# localhost:8080/index.php/
# localhost:8080/index.php/about/

# --------------------------------------------------------
# チュートリアル第二章を行う：http://codeigniter.jp/user_guide/3/tutorial/news_section.html
# --------------------------------------------------------
# ここも参考：http://pneskin2.nekoget.com/press/?p=1888
# まずはDB周りを用意しておく。
# Dockerコンテナのシェルの中に入る
docker exec -i -t db /bin/bash

mysql -u root -p # passward=password docker-compose.ymlを参照。
CREATE DATABASE IF NOT EXISTS test;
# show databases; これでデータベース一覧をみることができる。
CONNECT test;

CREATE TABLE news (
        id int(11) NOT NULL AUTO_INCREMENT,
        title varchar(128) NOT NULL,
        slug varchar(128) NOT NULL,
        text text NOT NULL,
        PRIMARY KEY (id),
        KEY slug (slug)
);
# desc news; これでテーブルのDDLを確認できる。
exit;

