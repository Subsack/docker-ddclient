##DDClient

DDclient is a Perl client used to update dynamic DNS entrie

This image for ddclient is based on Linuxserver.io's baseimage/template. It has Linuxservers.io's standard container features such as auto-updates and the ability to set UID and GID.

## Usage

NOTE: Your pid file has to be located under `/var/run/ddclient/ddclient.pid` for this to work properly with the UID/GID feature. This is set in ddclient.conf, you can check the generated sample if you are unsure.

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

Sometimes when using data volumes (-v flags) permissions issues can arise between the host OS and the container, in this case, on ddclient.conf. We avoid this issue by allowing you to specify the user PUID and group PGID. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work".

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Updates / Monitoring

* Shell access whilst the container is running: `docker exec -it ddclient /bin/bash`
* Upgrade to the latest version: `docker restart ddclient`
* To monitor the logs of the container in realtime: `docker logs -f ddclient`
