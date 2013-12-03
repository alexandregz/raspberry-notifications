#!/bin/bash
#programado por Juanmol para http://rsppi.blogspot.com

# Alexandre Espinosa Menor <aemenor@gmail.com>
# Identificaçom (password de seguridade e control de usuario)
# password por seguridade, por se muda o resource e nom temos acesso á raspberry
# Uso: Enviar password antes do resto 
PASSWORD="PASSWORD_CONFIG"
PASSWORD_RECIBIDO=$1

COMANDOS_PROIBIDOS=( rm passwd )

if [ "$PASSWORD_RECIBIDO" = "$PASSWORD" ]; then
	shift
fi

# Alexandre Espinosa Menor: o contato debe ser o nosso (quitar o "j" de `ls -d $HOME/.centerim/*@public.talk.google.com`)
if [ "$CONTACT_NICK" != 'RESOURCE_ACCOUNT_XMPP' ] && [ "$PASSWORD" != "$PASSWORD_RECIBIDO" ]; then
	echo "norl!"; 
	exit 1;
fi


case $1 in
        espacio)
                echo "El sistema tiene libre `df -h | grep rootfs | awk '{ print $4,$5 }'`"
        ;;

	sh)
		shift

		if [[ " ${COMANDOS_PROIBIDOS[*]} " == *" $1 "* ]]; then
			echo "$1: Comando proibido..."
			exit 1
		fi
	
		$@ 2>&1
	;;

	help)
		echo "comandos: espacio, sh, help, gitweb, gitweb stop, temperatura"
		echo "comandos sh proibidos: ${COMANDOS_PROIBIDOS[@]} "
	;;

	gitweb)
		if [[ $2 == "stop" ]]; then
			echo "parando gitweb..."
			cd /opt/git/raspberry-notifications.git;sudo git instaweb --httpd=webrick --stop
		else
			echo "lanzando gitweb..."
			cd /opt/git/raspberry-notifications.git;sudo git instaweb --httpd=webrick -p 80
		fi
	;;

	temperatura)
		vcgencmd measure_temp
	;;

        *)
                echo "$1 no lo entiendo, los comandos que entiendo son: espacio, sh, help, gitweb [stop], temperatura "
	;;
esac
