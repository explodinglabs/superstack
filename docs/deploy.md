## Environments

To deploy your app to other environments, you have a few options.

### 1. Version control

- Commit the migrations to your repository
- Push
- Pull changes on the remote server
- `docker compose run --rm iko deploy`

### 2. Build your container image with migrations included

- Build a custom Iko image using the Dockerfile included in this repo just for
  this purpose: `docker build -t yourrepo/youriko .`
- `docker push yourrepo/youriko`

Then on the remote server:

- `docker pull yourrepo/youriko`
- Update the compose.yaml to use your Iko image
- `docker compose run --rm iko deploy`

### 3. Copy migrations to remote

This is another option.
