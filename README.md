# README

## EC2の初期状態からrailsの環境構築を行うスクリプトです。DBはmysqlを利用します。

### 実行内容
- mariadbのアンインストール
- mysqlのインストール
- nodejsのインストール
- yarnのインストール
- rbenvのインストール
- ruby-buildのインストール
- rbenvでruby3.0.2のインストール
- gemでbundleのインストール

### 実行後に必要な作業内容
- mysqlの初期パスワード変更
    - railsでdbに接続する時期限切れのエラーになります。

    ```
    $ mysql -u root -p"
    musql> ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY "XXXX";"
    ```