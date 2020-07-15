#/bin/bash
read -p "Setiap Berapa Jam UDPGW Akan Di Restart ? " time ;
if [ -f /etc/cron.d/badvpn-auto ]
then
	rm -f /etc/cron.d/badvpn-auto
else
	printf -- ""
fi
if [ -f /usr/local/bin/badvpn-udpgw ]
then
	echo "0 */$time * * * root screen -dmS udp7200 /usr/local/bin/badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500 --client-socket-sndbuf 65535" > /etc/cron.d/badvpn-auto && echo "0 */$time * * * root screen -dmS udp7300 /usr/local/bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500 --client-socket-sndbuf 65535" >> /etc/cron.d/badvpn-auto
else
	printf -- ""
fi
if [ -f /usr/bin/badvpn-udpgw ]                                                              
then                                                                                               
	echo "0 */$time * * * root screen -dmS udp7200 /usr/bin/badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500 --client-socket-sndbuf 65535" > /etc/cron.d/badvpn-auto && echo "0 */$time * * * root screen -dmS udp7300 /usr/bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500 --client-socket-sndbuf 65535" >> /etc/cron.d/badvpn-auto                                       
else
	 printf -- ""
fi
service cron restart
sleep 0.5
printf -- "\n\n---------------AUTO RESTART TELAH TERPASANG---------------\n\n"
exit
