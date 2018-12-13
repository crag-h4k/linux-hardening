'Nix Sheet

See Operating System and  Version 
Uname -a
Cat /etc/issue 
Find Open Ports on Machine
nmap localhost -sV-oNscan.txt 
SSH Configuration
Check /etc/sshd_config
Find / -name “*key*” >> keysearch.txt
Find / -name “*key.pub*” >> keysearch.txt
Check User Accounts
/etc/passwd
Check Running Services
(systemd) systemctl list-unit-files
(sysvinit) chkconfig --list
Check cronjobs
crontab -l
For all users
for user in $(cut -f1 -d: /etc/passwd); do crontab -u $user -l; done
Mysql
mysql --user=root mysql -p
SELECT User FROM mysql.user;
ALTER USER dbadmin@localhost IDENTIFIED BY 'littlewhale';

Postgres
Run query from command line: *username is usually postgres
psql -U username -d mydatabase -c 'SELECT * FROM mytable'
This query below changes a users account with name super
ALTER ROLE super WITH PASSWORD 'secret123';
