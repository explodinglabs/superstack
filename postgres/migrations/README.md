# Migrations

Initialise Sqitch:

```sh
./sqitch init myapp --uri https://github.com/explodinglabs/myapp-db --engine pg
```

Create migration files:

```sh
./create.sh
```

Deploy migrations:

```sh
sqitch deploy
```
