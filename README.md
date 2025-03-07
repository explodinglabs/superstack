<p align="center"><img alt="Minibase logo" src="https://github.com/explodinglabs/minibase/blob/main/logo.png?raw=true" /></p>

Minibase is a lightweight backend infrastructure.

<img alt="Architecture diagram" src="https://github.com/explodinglabs/minibase/blob/main/architecture.png?raw=true" />

Create a .env file:

```sh
cp .example.env .env
```

Start Minibase:

```sh
docker compose -f compose.yaml -f compose.dev.yaml up -d
```

## Migrations

Initialise Sqitch:

```sh
sqitch init widgets --target db:pg:widgets
```

Run migrations:

```sh
sqitch deploy
```

## Production (move this to web app docs)

Build production OpenResty container:

```sh
docker compose build openresty
RESTY_DEB_FLAVOR="-debug" docker build -f openresty/Dockerfile -t ghcr.io/explodinglabs/myapp-web .
```

Push the image:

```sh
docker push ghcr.io/explodinglabs/myapp-openresty
```

Create a prod context:

```sh
docker context add ssh://
```

Bring up remote containers:

```sh
docker compose --context prod up -d
```
