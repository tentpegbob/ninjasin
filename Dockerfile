# Just a random development environment for testing
# At the command use: docker build --squash -t developer .
# then in order to use the netcat listener invoke the
# container with docker run -p 9999:9999 --privileged developer

#filename should be in the same directory as this Dockerfile
FROM ubuntu:latest

LABEL Description="This is a test Dockerfile for the Ultra Edit \
Wordfile which will setup a development environment for the C \
family of languages."
LABEL Version="1.0"

EXPOSE 9999

#In docker 1.10 and higher only RUN, COPY, and ADD create additional layers
RUN apt-get upgrade && apt-get update && \
apt-get install -y vim git build-essential cmake wget python-dev python3-dev clang gdb python-pip
RUN apt-get install -y socat

RUN wget https://raw.githubusercontent.com/tentpegbob/bearded-cyril/master/default-vim-cfg -O ~/.vimrc

COPY ./easy_overflow.c /tmp/easy_overflow.c
RUN cd /tmp; gcc easy_overflow.c -o file; chmod +x file

RUN groupadd -r usr && useradd -d /home/usr -r -g usr usr && cp /tmp/file /home/usr/file

#CMD is run after the container has been created versus RUN is done when the container is created
CMD ["echo", "0 > /proc/sys/kernel/randomize_va_space"]

WORKDIR /home/usr

#CMD should always be in the format CMD ["executable", "param1", "param2", ...]
CMD ["socat", "TCP-LISTEN:9999,fork,su=usr", "EXEC:/bin/bash -il,pty,stderr,sigint,sane,echo=0"]
