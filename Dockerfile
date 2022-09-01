FROM ubuntu


RUN sed -i 's#https://pypi.douban.com/simple/#' /etc/apt/sources.list;
RUN apt-get update
RUN apt-get install sudo
RUN sudo apt-get install curl


RUN sudo apt-get update
RUN apt-get install wget -y
RUN apt-get install git -y
Run sudo apt-get install unzip

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN sudo apt-get install python3-distutils -y
RUN python3 get-pip.py
RUN pip3 install pyTelegramBotAPI
RUN pip3 install apscheduler

RUN mkdir -p /qb
RUN chown 0777 /qb/ -R
COPY root /qb/

CMD wget https://raw.githubusercontent.com/winkxx/qb-rail/main/start.sh  && chmod 0777 start.sh && bash start.sh

