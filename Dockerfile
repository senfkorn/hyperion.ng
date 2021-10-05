FROM ubuntu:21.04

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections # buildkit
RUN apt-get update # buildkit
RUN apt-get -y upgrade # buildkit
RUN apt-get -y install curl wget dialog apt-utils libx11-6 libusb-1.0-0 libexpat1 libglu1-mesa libglib2.0-0 libfreetype6 # buildkit
RUN wget https://github.com/hyperion-project/hyperion.ng/releases/download/2.0.0-alpha.10/Hyperion-2.0.0-alpha.10-Linux-x86_64.deb # buildkit
RUN apt-get install -y ./Hyperion-2.0.0-alpha.10-Linux-x86_64.deb # buildkit
RUN apt-get -y autoclean     && apt-get -y clean     && apt-get -y autoremove     && rm Hyperion-2.0.0-alpha.10-Linux-x86_64.deb # buildkit
CMD ["hyperiond"]
