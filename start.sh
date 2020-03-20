#! /bin/sh
APPDIR="/srv/rrshareweb"
if [ ! -d "/mnt/config/conf" ]; then
    mkdir -p /mnt/config/conf
    cp -r $APPDIR/conf_/* /mnt/config/conf/
    ln -s /mnt/config/conf $APPDIR/conf
else
    ln -s /mnt/config/conf $APPDIR/conf
fi
sh -c $APPDIR/rrshareweb
