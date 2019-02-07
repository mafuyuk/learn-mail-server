# learn-mail-server
メールサーバーについて学習する

# アカウントが１つ必須らしいので用意したコマンド
```bash
docker run --rm \
  -e MAIL_USER=info@example.com \
  -e MAIL_PASS=1111 \
  -ti tvial/docker-mailserver:latest \
  /bin/sh -c 'echo "$MAIL_USER|$(doveadm pw -s SHA512-CRYPT -u $MAIL_USER -p $MAIL_PASS)"'
```

# Telnetで接続してみる
```bash
$ docker exec -it mail-client telnet mail-server 25
```