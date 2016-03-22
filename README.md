Docker image for ddclient based on Linuxserver.io's baseimage/template. 

I use a lot of their images and needed ddclient containerized as well, I've tried to use as much as I could of their practices making this image. This means it has Linuxservers.io standard container features such as auto-updates and the ability to set UID and GID.

## Usage

```
docker create \
	--name=ddclient \
	-e PUID=<UID> -e PGID=<GID> \
	-v </path/to/config>:/config \
	subsack/ddclient
```

**Parameters**

* `-v </path/to/config>:/config` - ddclient.conf location, if empty a sample config will be created*
* `-e PGID=` for for GroupID - see below for explanation
* `-e PUID=` for for UserID - see below for explanation

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" <sup>TM</sup>.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Updates / Monitoring

* Shell access whilst the container is running: `docker exec -it ddclient /bin/bash`
* Upgrade to the latest version: `docker restart ddclient`
* To monitor the logs of the container in realtime: `docker logs -f ddclient`
