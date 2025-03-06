# Minibase

Minibase is a lightweight backend infrastructure.

<img alt="Architecture diagram" src="https://github.com/explodinglabs/minibase/blob/main/architecture.png?raw=true" />

Install Minibase:

```sh
curl -sSL https://raw.githubusercontent.com/explodinglabs/minibase/main/scripts/install.sh | sh
```

```sh
docker-service get explodinglabs/postgres explodinglabs/openresty
```

# docker compose up -d -f postgres.yml -f postgrest.yml -f gotrue.yml -f openresty.yml

## OpenResty

Start OpenResty:

```sh
docker run
  --detach \
  --restart=unless-stopped \
  --name myapp-openresty \
  --network myapp \
  --volume ./openresty/conf.d:/etc/nginx/conf.d:Z \
  --publish 80:80 \
  ghcr.io/explodinglabs/openresty
```

## Postgres

Start Postgres:

```sh
docker run \
  --env POSTGRES_PASSWORD="postgres" \
  --env POSTGRES_DB="app" \
  --detach \
  --restart=unless-stopped \
  --name myapp-postgres \
  --network myapp \
  --volume ./data:/var/lib/postgresql/data:Z \
  ghcr.io/explodinglabs/postgres
```

## PostgREST

Start PostgREST:

```sh
docker run \
  --env PGRST_DB_URI="postgres://authenticator:mysecretpassword@myapp-postgres:5432/app" \
  --env PGRST_JWT_SECRET=$JWT_SECRET \
  --env PGRST_APP_SETTINGS_JWT_SECRET=$JWT_SECRET \
  --detach \
  --restart=unless-stopped \
  --name myapp-postgrest \
  --network myapp \
  ghcr.io/explodinglabs/postgrest
```

Copy `postgrest.conf` into OpenResty's configuration:

```sh
cp openresty/conf.d/postgrest.conf
```

```sh
docker exec myapp-openresty /usr/bin/openresty -s reload
```

## GoTrue

Start GoTrue:

```sh
TODO
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
