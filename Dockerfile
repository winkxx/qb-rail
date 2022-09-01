FROM ubuntu


COPY root /
RUN apt-get update
RUN apt-get install sudo

RUN sudo apt-get update
RUN apt-get install wget -y
RUN apt-get install git -y
sudo apt-get install unzip

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN sudo apt-get install python3-distutils -y
RUN python3 get-pip.py
RUN pip3 install pyTelegramBotAPI
RUN pip3 install apscheduler

RUN sudo chmod 777 /rclone
RUN mv /rclone /usr/bin/


CMD wget https://raw.githubusercontent.com/winkxx/qb-rail/main/start.sh  && chmod 0777 start.sh && bash start.sh

