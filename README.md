# Minibase

Minibase is a lightweight backend infrastructure.

<img alt="Architecture diagram" src="https://github.com/explodinglabs/minibase/blob/main/architecture.png?raw=true" />

Start Minibase:

```sh
docker compose -f compose.yaml -f compose.dev.yaml up -d
```

# Production

Build production OpenResty container:

```sh
docker build -f openresty/Dockerfile .
```

Push the image:

```sh
docker push ghcr.io/explodinglabs/myapp-openresty
```

Add prod context:

```sh
docker context add ssh://
```

Bring up remote containers:

```sh
docker compose --context prod up -d
```
