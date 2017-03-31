FROM java:8-jre

MAINTAINER Eriq Nelson (https://github.com/eriqnelson)

# Updating container
RUN apt-get update && \
	apt-get upgrade --yes --force-yes && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Setting workdir
WORKDIR /minecraft

# Changing user to root
USER root

# Creating user and adding server files
RUN useradd -m -U minecraft && \
	mkdir -p /minecraft/world

#Keep your directory clean of any old zips, this will vacuum up anything.

COPY *.zip /minecraft/minecraftserver.zip

RUN	unzip minecraftserver.zip && \
	rm minecraftserver.zip && \
	chmod u+x FTBInstall.sh ServerStart.sh && \
	echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt && \
	echo "$(date)" >> eula.txt && \
	echo "eula=TRUE" >> eula.txt && \
	chown -R minecraft:minecraft /minecraft
USER minecraft

# Running install
RUN /minecraft/FTBInstall.sh

# Expose port 25565
EXPOSE 25565

# Expose volume
VOLUME ["/minecraft/world"]

#Set MOTD
ENV MOTD You probably forgot to update a mod.


# Start server
CMD ["/bin/bash", "/minecraft/ServerStart.sh"]
