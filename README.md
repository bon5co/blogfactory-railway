# blogfactory-railway

Two thin wrappers over the upstream [BlogFactory](https://github.com/BlogFactoryHQ/blogfactory) v0.1.0 images
for the Railway template. Nothing else in the application is changed.

- `ghcr.io/bon5co/blogfactory-api`: bakes in the self-hosted switches (`BLOGFACTORY_SELF_HOSTED`, `NODE_ENV`,
  S3 user, bucket and region) and starts by creating the storage bucket and migrating, retrying while the storage
  and database services come up. Railway publishes literal template variables as required blanks, so the literals
  live in the image.
- `ghcr.io/bon5co/blogfactory-web`: the upstream nginx image patched to listen on `$PORT` instead of 80.

BlogFactory is licensed AGPL-3.0 by its authors; see https://github.com/BlogFactoryHQ/blogfactory/blob/main/LICENSE
