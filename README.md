# Dockerized composer install

This image was built to use in a [Drone CI](https://drone.io/) pipeline.

It will basically run `composer install --prefer-dist --no-progress --no-scripts --ignore-platform-reqs` in your project.

You can optionally set the following settings:

```yaml
steps:
  - name: composer
    image: stayallive/composer-install
    pull: always
    settings:
      # (optionally) Set the GitHub oAuth token for to fix rate limit errors
      # default: empty
      github_token:
        from_secret: github_token
      # (optionally) Disable parallel install using hirak/prestissimo
      # default: true
      parallel: false
```
