#! /bin/sh
if [ ! -d "/mnt/data/conf" ]; then
    mkdir -p /mnt/data/conf
    cp -r /rrshare/rrshareweb/conf_/* /mnt/data/conf/
    ln -s /mnt/data/conf /rrshare/rrshareweb/conf
else
    ln -s /mnt/data/conf /rrshare/rrshareweb/conf
fi
sh -c /rrshare/rrshareweb/rrshareweb
