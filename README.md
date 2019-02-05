# Simple Python Package Repo

And I mean really simple one ;)

### Install packages from your server

```
pip install yourpackage --index-url https://pindex.example.com/
```

### Create service with traefik

```
> docker service create  \
  --name pindex-example-com \
  --mount type=volume,source=pypi-packages,target=/packages \
  --label traefik.port=80  \
  --label traefik.frontend.rule=Host:pindex.example.com  \
  --network traefik-net  \
  yitsushi/simple-python-package-repo:latest
```

### Simples publish logic with scp

In your repo locally:

```
> python setup.py bdist_wheel
> scp dist/*.whl yourserver:packages/yourpackage/
> ssh yourserver ./sync-published-packages.sh
```

*sync-published-packages.sh:*

```
docker run \
  --rm \
  --volume `pwd`/packages:/new_packages \
  --volume pypi-packages:/packages \
  alpine /bin/ash -c 'apk add --no-cache rsync && rsync -avzh /new_packages/* /packages'
```
