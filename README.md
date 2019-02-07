# learn-mail-server
メールサーバーについて学習する

# Play
環境構築
```bash
$ docker-compose up -d
```

Mailサーバーログ確認
```bash
$ docker logs -f mail-server
```

wip メール送信(port 25)
```bash
$ docker exec -it mail-client telnet mail-server 25
HELO mail-client
MAIL FROM:aaaa@example.com
RCPT TO:mafuyuk.m@gmail.com
DATA

From: "Mehrdad" <aaaa@example.com>
To: "Mafuyuk" <mafuyuk.m@gmail.com>
Subject: Hello World!

こにゃにゃちわ～

.
QUIT
```

wip メール送信(port 587)
```bash
$ docker exec -it mail-client telnet mail-server 587
HELO mail-client
STARTTLS
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