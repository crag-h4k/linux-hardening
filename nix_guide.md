### General:

Always remember man pages

#### Package managers

Debian/Ubuntu = apt/apt-get
Metasploitable = apt-get
Red Hat/Cent-OS/Fedora/Amazon Linux = yum
Arch Linux = pacman

#### Basic IP Tables

#### Check Existing iptables

iptables -L
Block Single IP address, all ports
iptables -A INPUT -s <IP> -j DROP
Block Single IP address, single port
iptables -A INPUT -s <IP> -p tcp --destination-port <portnumber>-j DROP
Block All Ports
iptables -A INPUT -p tcp --destination-port <PORT> -j DROP
 only drop port for given IP or Subnet
iptables -A INPUT -i eth0 -p tcp --destination-port <PORT> -s {IP-ADDRESS-HERE} -j DROP



Advanced IP Tables

How to notice red team
Look for strange processes
htop
Look at security logs
tail -f 
/var/log/secure
/var/log/messages
/var/log/auth.log
Netstat
netstat -tulpna

New User Configuration files 
	
To add a new user
useradd <username>
adduser <username>
Configuration files for new users are located at /etc/skel and in /etc/adduser.conf
To make a sudo user
usermod -a -G sudo <username>

How to change a password
Single user
passwd <username>
Groud
passwd -g <groupname>
	
Lock Accounts:
Delete the user record from /etc/passwd	
Lock account and make it inaccessible
passwd <username> -l -expiredate 1

Grep commands
Find String in all Files
grep -rnw <pattern> <path>

Killing Processes
kill -9 ${ ps aux| grep <process_name>}
pkill <process_name>

System Commands

Sysvinit Command
Systemd Command
Notes
service frobozz start
systemctl start frobozz
Used to start a service (not reboot persistent)
service frobozz stop
systemctl stop frobozz
Used to stop a service (not reboot persistent)
service frobozz restart
systemctl restart frobozz
Used to stop and then start a service
service frobozz reload
systemctl reload frobozz
When supported, reloads the config file without interrupting pending operations.
service frobozz condrestart
systemctl condrestart frobozz
Restarts if the service is already running.
service frobozz status
systemctl status frobozz
Tells whether a service is currently running.
ls /etc/rc.d/init.d/
systemctl (or) systemctl list-unit-files --type=service (or) 
ls /lib/systemd/system/*.service /etc/systemd/system/*.service
Used to list the services that can be started or stopped 
Used to list all the services and other units
chkconfig frobozz on
systemctl enable frobozz
Turn the service on, for start at next boot, or other trigger.
chkconfig frobozz off
systemctl disable frobozz
Turn the service off for the next reboot, or any other trigger.
chkconfig frobozz
systemctl is-enabled frobozz
Used to check whether a service is configured to start or not in the current environment.
chkconfig --list
systemctl list-unit-files --type=service (or) ls /etc/systemd/system/*.wants/
Print a table of services that lists which runlevels each is configured on or off
chkconfig --list | grep 5:on
systemctl list-dependencies graphical.target
Print a table of services that will be started when booting into graphical mode
chkconfig frobozz --list
ls /etc/systemd/system/*.wants/frobozz.service
Used to list what levels this service is configured on or off
chkconfig frobozz --add
systemctl daemon-reload
Used when you create a new service file or modify any configuration



How to deal with outdated machines

Set up Docker
Splunk (forwarder and local)
IDS
Look up Docker official stuff and Ubuntu (DigitalOcean in the folder)

Cobalt Strike

IDS:
Fail2ban
Psad
Bro && broctl
Suricata
Snrt
OSSec

Windows
inetpub folder (only with IIS)

sysmon (can recreate whole machine)

event logs (registry)

prefetch files

Network
Wireshark

Intrusion Detection System - Fireeye HX device

TCP Dump
	To print traffic between helios and either hot or ace:
tcpdump host helios and \( hot or ace \)


To print all IP packets between ace and any host except helios:
tcpdump ip host ace and not helios

Netcat (nc) - look at ports and banners








