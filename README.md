raspberry-notifications
=======================

Just a bash script to install a notification/commander system with Google Hangouts on Raspberry, using "pi" user


Install
=======

- $ sudo apt-get install centerim
- $ centerim
- $ /bin/bash install.sh
- Add this line to /etc/rc.local, always before 'exit 0':
    su pi -c '/home/pi/bin/centerim.sh'


Requirements
============
- centerim installed



Credit
======

All credit to author from this article:
http://rsppi.blogspot.com.es/2013/07/uso-de-hangouts-gtalk-para-el-envio-de.html
