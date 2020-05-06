FROM ubuntu:rolling

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install curl wget dialog apt-utils libx11-6 libusb-1.0-0 libexpat1 libglu1-mesa libglib2.0-0 libfreetype6
RUN wget https://github.com/hyperion-project/hyperion.ng/releases/download/2.0.0-alpha.5/Hyperion-2.0.0-alpha.5-Linux-a$RUN apt-get install -y ./Hyperion-2.0.0-alpha.5-Linux-amd64-x11.deb

CMD ["hyperiond"]
