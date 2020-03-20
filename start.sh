#! /bin/sh
if [ ! -d "/mnt/config/conf" ]; then
    mkdir -p /mnt/config/conf
    cp -r /rrshare/rrshareweb/conf_/* /mnt/config/conf/
    ln -s /mnt/config/conf /rrshare/rrshareweb/conf
else
    ln -s /mnt/config/conf /rrshare/rrshareweb/conf
fi
sh -c /rrshare/rrshareweb/rrshareweb
