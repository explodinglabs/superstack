# Minibase

Minibase is a lightweight backend infrastructure.

<img alt="Architecture diagram" src="https://github.com/explodinglabs/minibase/blob/main/architecture.png?raw=true" />

Start Minibase:

```sh
docker compose -f compose.yaml -f compose.dev.yaml up -d
```

Run migrations:

```sh
sqitch init widgets --target db:pg:widgets
```

```sh
sqitch deploy
```

## Production (this is web app docs?)

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
