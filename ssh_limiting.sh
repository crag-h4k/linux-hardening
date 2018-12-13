#!/usr/bin/bash
#must run as root
IFACE='eth0'

DPORT=22
SECONDS=60
HITS=4

iptables -L

read -p "These are the current rules do you want to continue? (y?)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
    then
        iptables -I INPUT -p tcp --dport $DPORT -i $IFACE -m state --state NEW -m recent --set
        iptables -I INPUT -p tcp --dport $DPORT -i $IFACE -m state --state NEW -m recent  --update --seconds $SECONDS --hitcount $HITS -j DROP

        iptables-save > /etc/iptables-rules
        iptables-restore < /etc/iptables-rules
fi

