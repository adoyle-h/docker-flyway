# docker-flyway

A docker image for [flyway][] [command-line tool](https://flywaydb.org/documentation/commandline/).

The image integrates with [wait-for-it][] script, because docker-compose does not wait for
dependency container *available*. Refer to the article "[Controlling startup order in Compose][]".


## TOC

<!-- MarkdownTOC GFM -->

- [Build Image](#build-image)
- [Run Container](#run-container)
    - [Entrypoint](#entrypoint)
    - [Command](#command)
- [Environments](#environments)
- [flyway.conf](#flywayconf)
- [Migration Files](#migration-files)
- [Debug](#debug)
- [Copyright and License](#copyright-and-license)

<!-- /MarkdownTOC -->

## Build Image

`docker build --build-arg FLYWAY_VERSION=4.2.0 -t <image-name:tag> .`

The build argument `FLYWAY_VERSION` is optional, which defaults to 4.2.0.

## Run Container

Refer to the [`docker-compose.yml`](./docker-compose.yml).

Execute `docker-compose up`.

### Entrypoint

The `ENTRYPOINT` locates at `/opt/bin/entrypoint.sh`. You could change the default behaviors by mounting your `entrypoint.sh` file, or use `--entrypoint` option with `docker` command.

### Command

The `CMD` locates at `/opt/bin/cmd.sh`. You could change the default behaviors by mounting your `cmd.sh` file, or overwrite it with `docker` command.

Use [`docker-compose.yml`](./docker-compose.yml) for example: `docker-compose run flyway flyway info`

`flyway` could be referenced in `$PATH`.


## Environments

- Required
    - DB_HOST
    - DB_PORT
    - DB_USER
    - DB_PWD
    - DATABASE
    - WAIT_HOST: Same to `DB_HOST` in general
    - WAIT_PORT: Same to `DB_PORT` in general
- Optional
    - url: Defaults to `jdbc:mysql://"$DB_HOST":"$DB_PORT"/"$DATABASE"`
    - locations: Defaults to `filesystem:$SQL_DIR,classpath:$JAVA_DIR`
        - SQL_DIR: Defaults to `/home/app/sql`
        - JAVA_DIR: Defaults to `/home/app/java`
    - WAIT_OPTS: Defaults to `-s`. More options refer to [wait-for-it][]
    - WAIT_TIMEOUT: Defaults to `30`, count in seconds.

You can set these environment variables via `docker run -e`.

## flyway.conf

The default flyway.conf is [here](./src/flyway.conf). **It change the flyway default behaviors**.

You could mount yours on `/home/app/src/flyway.conf`.

## Migration Files

You should mount your migration files on `/home/app/sql` for SQL migrations and `/home/app/java` for Java migrations.

## Debug

`docker-compose run --rm flyway /bin/bash`


## Copyright and License

Copyright (c) 2017 ADoyle. The project is licensed under the **Apache License Version 2.0**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.


<!-- Links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE

<!-- links -->

[flyway]: https://github.com/flyway/flyway
[wait-for-it]: https://github.com/vishnubob/wait-for-it
[Controlling startup order in Compose]: https://docs.docker.com/compose/startup-order/
