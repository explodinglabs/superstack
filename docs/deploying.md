# ☁️ Deploying to Remote Environments

SuperStack is Docker-native, so deployment is simple and portable. Here's
how to deploy it to a remote server.

## ✅ 1. Set Your Image Names

In `compose.yaml`, change the image names to your own (e.g. using your
Docker Hub or GitHub Container Registry account):

For example:

```yaml
postgres:
  image: ghcr.io/youruser/yourapp-postgres
```

## 🛠️ 2. Build and Push the Images

Build locally and push to your registry:

```sh
docker compose build
docker compose push
```

## 📦 3. Deploy the Compose File

Only `compose.yaml` is required on the server. Copy it over:

```sh
scp compose.yaml youruser@yourserver:
```

## 🚀 4. Launch SuperStack on the Server

SSH into your server and run:

```sh
docker compose up -d
```

That’s it — your backend is live.

## 🔐 Environment Variables

For production, avoid using `.env` files. Instead, set secrets directly:

```sh
CADDY_PORT=80 \
PG_USER=admin \
PG_PASS=supersecret \
POSTGREST_AUTHENTICATOR_PASS=supersecret \
JWT_SECRET=your-secret \
docker compose up -d
```

> 💡 Avoid leaking secrets by disabling shell history. Alternatively, use
> environment injection in your CI/CD.

## 🔄 Upgrading Remote Environments

When you release changes — like new migrations or updated images — you can
upgrade your remote stack in two simple steps.

### 1. Pull the Latest Images

On the remote server, run:

```sh
docker compose pull
```

This fetches the latest versions of your tagged images (as defined in
`compose.yaml`).

### 2. Apply Any New Migrations

Then run your migration script inside the running Postgres container:

```sh
bin/postgres migrate
```

This ensures your database schema is up to date.

### 3. Restart the Stack (if needed)

If you’ve made changes to service definitions or image tags:

```sh
docker compose up -d
```

Docker Compose will only restart containers if something changed.
