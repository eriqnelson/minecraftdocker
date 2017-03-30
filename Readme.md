# Modded Minecraft Development
Rather than digging through the Curse CDN trying to find the wgettable direct downloads, this assumes that the modpack and minecraft server files are present on the local host on build. This has been a better solution for me given how frequently my servers require tweaking before settling into a configuration. Once a modpack has become stable there's less reason for this sort of "worst practices" approach and a new Dockerfile should be drafted; especially if you're moving it onto a production host.

## Better Dockerfiles
There are better dockerfiles out there if you're not building and rebuilding them twenty times in an afternoon.

##Run this container

'docker run -d -p 25565:25565 --name mcdevserver'
