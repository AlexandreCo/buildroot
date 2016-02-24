#!/bin/sh
#
# Synchronise deux répertoires en utilisant FTP

HOST=`cat /root/Documents/notsync/ftp.host`
LOGIN=`cat /root/Documents/notsync/ftp.login`
PASSWORD=`cat /root/Documents/notsync/ftp.pass`
EXCLUDED="*.*~"

if [ -e "/root/log_ecowatt_brut" ]
then
  chmod -R 644 /root/log_ecowatt_brut
  lftp -c "set ftp:list-options -a;
  open ftp://$LOGIN:$PASSWORD@$HOST; 
  lcd /root/log_ecowatt_brut;
  cd /rpi-data/log_ecowatt_brut;
  mirror --reverse \
         --delete \
         --verbose \
         --exclude-glob $EXCLUDED;";

fi
