#!/bin/bash
pip install qbittorrentapi
mkdir -p /config/
chown 0777 /config/ -R
mkdir -p /downloads/
chown 0777 /downloads/ -R
# 检查config配置文件，并创建
if [ ! -e "/config/qBittorrent/config/qBittorrent.conf" ] ;  then 
mkdir -p /config/qBittorrent/config/
cp /qb/usr/local/qbittorrent/defaults/qBittorrent.conf  /config/qBittorrent/config/qBittorrent.conf
fi
# permissions
#chown 0777 -R /config \
    #/downloads

git clone https://github.com/winkxx/qb-rail
chmod 0777 /qb-rail/upload -R
chmod 0777 /qb-rail/config -R
mkdir -p /config/rclone/
mkdir -p /upload/
mv  -n /qb-rail/config/* /config/rclone/
mv  -n /qb-rail/upload/* /upload
chmod 0777 /upload/ -R
chmod 0777 /config/rclone/ -R
rm -rf /qb-rail

#安装qb
wget -qO /usr/bin/qbittorrent-nox https://github.com/userdocs/qbittorrent-nox-static/releases/latest/download/x86_64-qbittorrent-nox
chmod 700 /usr/bin/qbittorrent-nox

#安装rclone
bash <(curl -sL install.emengweb.com/fclone.sh)
mv /usr/bin/fclone /usr/bin/rclone
chmod 777 /usr/bin/rclone




nohup yes "" | qbittorrent-nox --webui-port=$PORT  --profile=/config  &
python3 /upload/config.py
python3 /upload/dingshi.py
