FROM ubuntu


FROM ubuntu

RUN apt-get update
RUN apt-get install sudo
RUN sudo apt-get update
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN apt-get install wget -y
RUN apt-get install git -y
RUN apt-get install curl -y
RUN apt-get install unzip -y
RUN sudo apt install python3 -y
RUN sudo apt install python3-dev -y
RUN sudo apt install python3-pip -y
RUN sudo apt install python3-pillow -y
RUN sudo apt update


RUN pip3 install pyTelegramBotAPI
RUN pip3 install apscheduler

RUN mkdir -p /qb
RUN chown 0777 /qb/ -R
COPY root /qb/

CMD wget https://raw.githubusercontent.com/winkxx/qb-rail/main/start.sh  && chmod 0777 start.sh && bash start.sh

