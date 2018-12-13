#!/usr/bin/bash
#must run as root
iface='eno1'
dport=22
seconds=60
hits=4

iptables -L
read -p "These are the current rules, do you want to continue? (y?)" -n 1 -r
echo "interface" $iface
echo "port " $dport
echo "every" $seconds "seconds"
echo "hits " $hits
read -p "Correct variables? (y?)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
    then
        iptables -I INPUT -p tcp --dport $dport -i $iface -m state --state NEW -m recent --set
        iptables -I INPUT -p tcp --dport $dport -i $iface -m state --state NEW -m recent  --update --seconds $seconds --hitcount $hits -j DROP

#        iptables-save > /etc/iptables-rules
#        iptables-restore < /etc/iptables-rules
fi
#
echo "\n"
iptables -L
