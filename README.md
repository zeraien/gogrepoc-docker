Use a cron job to backup your GOG games regularly.

In this case I've built the docker image locally and tagged it with the :local tag.

In addition the image expects you to already have the gogrepoc token file so you need to run the script and do the login procedure
first so the token file is generated and saved in `/host/games/gog` folder (this folder structure is just for demo purposes).

Here is an example docker compose file:

```
services:
  gogrepoc:
    image: 'gogrepoc:local'
    network_mode: "host"
    working_dir: /gog/
    entrypoint: bash -c "python ~/gogrepoc.py update && python ~/gogrepoc.py download"
    volumes:
      - type: bind
        source: /host/games/gog
        target: /gog
```

Alternatively use the docker run command:

```bash
docker run --rm --name gogrepoc -v /host/games/gog:/gog -i -t gogrepoc:local bash -c "cd /gog && python ~/gogrepoc.py update && python ~/gogrepoc.py download"
```
