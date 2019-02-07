# learn-mail-server
メールサーバーについて学習する

# Play


```bash
$ docker-compose up -d
$ docker exec -it mail-client telnet mail-server 25
```

# その他
アカウントが１つ必須らしいので、アカウントを用意したコマンド
config/postfix-accounts.cfに配置してあるので意識しなくても良い
```bash
docker run --rm \
  -e MAIL_USER=info@example.com \
  -e MAIL_PASS=1111 \
  -ti tvial/docker-mailserver:latest \
  /bin/sh -c 'echo "$MAIL_USER|$(doveadm pw -s SHA512-CRYPT -u $MAIL_USER -p $MAIL_PASS)"'
```