#!/usr/bin/bash
#must run as root
iface='eno1'
sshd_port=$1
seconds=60
hits=4

ssh_rule0="-I INPUT -p tcp --dport $sshd_port -i $iface -m state --state NEW -m recent --set"
ssh_rule1="-I INPUT -p tcp --dport $sshd_port -i $iface -m state --state NEW -m recent  --update --seconds $seconds --hitcount $hits -j DROP"

rules_conf='/etc/iptables.rules'
line_break="=================================="

iptables -L;
printf $line_break;
read -p "These are the current rules, do you want to continue? (y)" -n 1 -r;

if ! [[ $REPLY =~ ^[Yy]$ ]]; then
    exit 1;
    else
    printf "interface $iface";
    printf "port $sshd_port";
    printf "every $seconds seconds";
    printf "hits  $hits";
    printf $line_break;
fi

read -p "Correct variables? (y)" -n 1 -r;

if ! [[ $REPLY =~ ^[Yy]$ ]]; then
    exit 1;
    else
        iptables $ssh_rule0;
        iptables $ssh_rule1;
        iptables-save > '$rules_conf';
        iptables-restore < '$rules_conf';
fi
printf $line_break;
fi
#
printf $line_break;
iptables -L;
printf $line_break;
printf "REMEMBER to save set a cronjobs or in rc.local to have \" pre-up iptables-restore < $rules_conf\" in it.";
