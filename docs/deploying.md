# Deploying to Remote Environments

To deploy your app to other environments, you have a few options.

### Build your container image with migrations included

Could just docker compose build?

- Build a custom Iko image using the Dockerfile included in this repo just for
  this purpose:

docker compose build
#docker -f iko/Dockerfile -t ghcr.io/explodinglabs/yourapp-iko:0.1.0 -t ghcr.io/explodinglabs/yourapp-iko:latest
docker compose push

- `docker push yourrepo/yourapp-iko`

Then on the remote server:

- `docker pull yourrepo/yourapp-iko`
- Update the compose.yaml to use your Iko image
- `docker compose run --rm iko deploy`
