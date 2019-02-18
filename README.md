# docker-bokeh

This project builds a base docker image to utilize in docker bokeh projects.  A lot of this was borrowed from the docker-tools area in the bokeh project so great thanks to bryevdv for the initial work on this.  This is also using the anaconda version of the docker-tools Docker file as a base for this.  The main tweak here is making this base image extendable to inject our own bokeh appfiles for production builds and having hte ability to use this for local development as well.  Also added a couple key libraries for data interaction.

# build command

`docker build --file Dockerfile --build-arg BOKEH_VERSION=0.13.0 --tag bokeh:0.13.0 .`