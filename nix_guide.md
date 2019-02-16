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

##### Block Single IP address, all ports

    iptables -A INPUT -s <IP> -j DROP

##### Block Single IP address, single port

    iptables -A INPUT -s <IP> -p tcp --destination-port <portnumber>-j DROP

##### Block All Ports

    iptables -A INPUT -p tcp --destination-port <PORT> -j DROP

##### only drop port for given IP or Subnet

    iptables -A INPUT -i eth0 -p tcp --destination-port <PORT> -s {IP-ADDRESS-HERE} -j DROP

### Advanced IP Tables

#### How to notice red team

##### Look for strange processes

    htop

##### Look at security logs

    tail -f 
    /var/log/secure
    /var/log/messages
    /var/log/auth.log
    Netstat
    netstat -tulpna

#### New User Configuration files 
    /etc/skel
    /etc/adduser.conf

##### To add a new user

    useradd <username>
    adduser <username>

#### Configuration files for new users are located at /etc/skel and in /etc/adduser.conf

##### To make a sudo user

    usermod -a -G sudo <username>

##### How to change a password

##### Single user

    passwd <username>

##### Group

    passwd -g <groupname>
	
##### Lock Accounts:

#### Delete the user record from /etc/passwd	

#### Disable login the user record from /etc/passwd	
    
    /bin/nologin

##### Lock account and make it inaccessible


    passwd <username> -l -expiredate 1

#### Grep commands

##### Find String in all Files
   
    grep -rnw <pattern> <path>

#### Killing Processes

    kill -9 ${ ps aux| grep <process_name>}
    pkill <process_name>

#### System Commands

##### Sysvinit Command & Systemd Commands

###### Used to start a service (not reboot persistent)

    service frobozz start
    systemctl start frobozz
    
    
###### Used to stop a service (not reboot persistent)

    service frobozz stop
    systemctl stop frobozz
    
    
###### Used to stop and then start a service
    
    service frobozz restart
    systemctl restart frobozz


###### When supported, reloads the config file without interrupting pending operations.

    service frobozz reload
    systemctl reload frobozz


###### Restarts if the service is already running.

    service frobozz condrestart
    systemctl condrestart frobozz

###### Tells whether a service is currently running.

    service $Service-name status
    systemctl status $Service-name

    ls /etc/rc.d/init.d/

    systemctl list-unit-files

    ls /lib/systemd/system/*.service /etc/systemd/system/*.service

    chkconfig $Service-name

### IDS:
	
	Fail2ban
	Psad
	Bro && broctl
	Suricata


### Check cronjobs

    crontab -l

#### For all users

    for user in $(cut -f1 -d: /etc/passwd); do crontab -u $user -l; done

### Mysql

    mysql_secure_installation

    mysql --user=root mysql -p

    SELECT User FROM mysql.user;

    ALTER USER dbadmin@localhost IDENTIFIED BY 'littlewhale';

### Postgres

#### Run query from command line: *username is usually postgres

    psql -U username -d mydatabase -c 'SELECT * FROM mytable'

#### This query below changes a users account with name super

    ALTER ROLE super WITH PASSWORD 'secret123';
