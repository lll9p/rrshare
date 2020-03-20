#! /bin/sh
APPDIR="/srv/rrshareweb"
if [ ! -f "/mnt/conf" ]; then
    mkdir -p /mnt/conf
    cp -r $APPDIR/conf_/* /mnt/conf/
    ln -s /mnt/conf $APPDIR/conf
else
    ln -s /mnt/conf $APPDIR/conf
fi
sh -c $APPDIR/rrshareweb
