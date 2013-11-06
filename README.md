raspberry-notifications
=======================

Just a bash script to install a notification/commander system with Google Hangouts on Raspberry, using "pi" user


Install
=======

- Use install.sh with bash shell.
- Add this line to /etc/rc.local, always before 'exit 0':
    su pi -c '/home/pi/bin/centerim.sh'


Requirements
============
- centerim installed
- sendxmpp installed to use msg_centerim.sh


Notes
=====

To check first try to execute centerim into your system.


Credit
======

All credit to author from this article:
http://rsppi.blogspot.com.es/2013/07/uso-de-hangouts-gtalk-para-el-envio-de.html
