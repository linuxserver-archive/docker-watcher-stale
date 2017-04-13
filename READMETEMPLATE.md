[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/
[appurl]: https://github.com/nosmokingbandit/watcher3
[hub]: https://hub.docker.com/r/linuxserver/watcher/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/watcher

[![](https://images.microbadger.com/badges/image/linuxserver/watcher.svg)](http://microbadger.com/images/linuxserver/watcher "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/watcher.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/linuxserver/watcher.svg)][hub][![Build Status](http://jenkins.linuxserver.io:8080/buildStatus/icon?job=Dockers/LinuxServer.io-hub-built/linuxserver-watcher)](http://jenkins.linuxserver.io:8080/job/Dockers/job/LinuxServer.io-hub-built/job/linuxserver-watcher/)

[Watcher][appurl] is an automated movie NZB searcher and snatcher. You can add a list of wanted movies and Watcher will automatically send the NZB to Sabnzbd or NZBGet. Watcher also has basic post-processing capabilities such as renaming and moving.

[![watcher](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/watcher-banner.png)][appurl]

## Usage

```
docker create \
--name=watcher \
-v <path to data>:/config \
-v <path to data>:/downloads \
-v <path to data>:/movies \
-e PGID=<gid> -e PUID=<uid>  \
-e TZ=<timezone> \
-p 9090:9090 \
  linuxserver/watcher
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 9090` - the port(s)
* `-v /config` - Watcher Application Data
* `-v /downloads` - Downloads Folder
* `-v /movies` - Movie Share
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for timezone information, eg Europe/London

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it watcher /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application


## Info

* Shell access whilst the container is running: `docker exec -it watcher /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f watcher`

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' watcher`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/watcher`

## Versions

+ **dd.MM.yy:** Initial Release.
