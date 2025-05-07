# db-adminer

## Install devbox
```shell
$ make install-devbox
```

## Download adminer
```shell
$  curl -L -o public/adminer.php "https://github.com/vrana/adminer/releases/download/v5.3.0/adminer-5.3.0.php"
```

## Run services
```shell
$ make up # in foreground
$ make upd # in background
```

## View in browser
```shell
$ make open
```

## Stop services
```shell
$ make down
```
