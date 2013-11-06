#!/bin/bash
#
# Installer to have notifications with centerim+Google Hangouts on raspberry
# Ripped from: http://rsppi.blogspot.com.es/2013/07/uso-de-hangouts-gtalk-para-el-envio-de.html
# Alexandre Espinosa Menor <aemenor@gmail.com>
#
# To start, add these lines to /etc/rc.local:
#	# para arrancar centerim
#	su pi -c '/home/pi/bin/centerim.sh'
#

DIRETORIO="$HOME/bin"
#DIRETORIO="/tmp/bin"

DIRETORIO_CENTERIM="$HOME/.centerim"
#DIRETORIO_CENTERIM="/tmp/bin/centerim"

# works if you have only one contact with chat
RESOURCE_ACCOUNT_XMPP_TMP=`ls -d $DIRETORIO_CENTERIM/*@public.talk.google.com|sed s#$DIRETORIO_CENTERIM/j##`
#RESOURCE_ACCOUNT_XMPP_TMP='myresourcexmpp@public.talk.google.com'


#
# config and external at .centerim
#
echo "Please enter your email account (ex: myemail@gmail.com): "
read EMAIL 

echo "Please enter your email password: "
read -s PASSWORD

sed -i.bak -e "s/EMAIL/$EMAIL/" -e "s/PASSWORD/$PASSWORD/" config
sed -i.bak -e "s#DIRETORIO#$DIRETORIO#" external


#
# contestador.sh e msg_centerim.sh
#
echo "Please enter your resource for admin account (default value: $RESOURCE_ACCOUNT_XMPP_TMP): "
read RESOURCE_ACCOUNT_XMPP
RESOURCE_ACCOUNT_XMPP=${RESOURCE_ACCOUNT_XMPP:-"$RESOURCE_ACCOUNT_XMPP_TMP"}

echo "Please enter your password (if resource identification is unavailable): "
read -s PASSWORD_CONFIG

sed -i.bak -e "s/RESOURCE_ACCOUNT_XMPP/$RESOURCE_ACCOUNT_XMPP/" -e "s/PASSWORD_CONFIG/$PASSWORD_CONFIG/" contestador.sh
sed -i.bak -e "s/RESOURCE_ACCOUNT_XMPP/$RESOURCE_ACCOUNT_XMPP/" msg_centerim.sh


# mv
if [ ! -d "$DIRETORIO" ]; then
	mkdir $DIRETORIO
	#debug
	mkdir -p $DIRETORIO_CENTERIM
fi


mv config external $DIRETORIO_CENTERIM
mv centerim.sh contestador.sh msg_centerim.sh $DIRETORIO 

