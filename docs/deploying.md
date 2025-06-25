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
caddy:
  image: ghcr.io/youruser/yourapp-caddy
```

## 🛠️ 2. Build and Push the Images

Build your images locally and push to your registry:

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

SSH into your server, and bring up the stack.

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

That’s it — your backend is live.

If it's the first time bringing up your stack, the migrations will run
automatically when you `docker compose up`. Subsequently, you should run
`docker compose exec postgres migrate` (and don't forget to include the
environment variables).
