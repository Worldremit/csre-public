$1

apt-get update   #-- check for updates
apt-get install openssh-server #-- install SFTP
cp /etc/vsftpd.conf /etc/vsftpd.conf.bk #-- backup config
addgroup ftpaccess #-- create group for SFTP users

#/etc/ssh/sshd_config --> needs to be added to file following amends to bottom --> 

cat "#Subsystem sftp internal-sftp" >> /etc/ssh/sshd_config
cat "X11Forwarding no" >> /etc/ssh/sshd_config
cat "Match group ftpaccess" >> /etc/ssh/sshd_config
cat "ChrootDirectory %h" >> /etc/ssh/sshd_config
cat "AllowTcpForwarding no" >> /etc/ssh/sshd_config
cat "ForceCommand internal-sftp" >> /etc/ssh/sshd_config

systemctl restart ssh #-- restart to pick up config changes from sshd_config update

useradd -m dev-testuser -s /usr/sbin/nologin -G ftpaccess #-- add users
passwd $1
chown root:root /home/dev-testuser
mkdir /home/dev-testuser/upload
chown dev-testuser:ftpaccess /home/dev-testuser/upload

useradd -m dev-bhd -s /usr/sbin/nologin -G ftpaccess
passwd $1
chown root:root /home/dev-bhd
mkdir /home/dev-bhd/upload
chown dev-bhd:ftpaccess /home/dev-bhd/upload

useradd -m dev-bolivariano -s /usr/sbin/nologin -G ftpaccess
passwd $1
chown root:root /home/dev-bolivariano
mkdir /home/dev-bolivariano/upload
chown dev-bolivariano:ftpaccess /home/dev-bolivariano/upload

useradd -m dev-davivienda -s /usr/sbin/nologin -G ftpaccess
passwd $1
chown root:root /home/dev-davivienda
mkdir /home/dev-davivienda/upload
chown dev-davivienda:ftpaccess /home/dev-davivienda/upload

useradd -m int-testuser -s /usr/sbin/nologin -G ftpaccess
passwd $1
chown root:root /home/int-testuser
mkdir /home/int-testuser/upload
chown int-testuser:ftpaccess /home/int-testuser/upload

useradd -m int-bhd -s /usr/sbin/nologin -G ftpaccess
passwd $1
chown root:root /home/int-bhd
mkdir /home/int-bhd/upload
chown int-bhd:ftpaccess /home/int-bhd/upload

useradd -m int-bolivariano -s /usr/sbin/nologin -G ftpaccess
passwd $1
chown root:root /home/int-bolivariano
mkdir /home/int-bolivariano/upload
chown int-bolivariano:ftpaccess /home/int-bolivariano/upload

useradd -m int-davivienda -s /usr/sbin/nologin -G ftpaccess
passwd $1
chown root:root /home/int-davivienda
mkdir /home/int-davivienda/upload
chown int-davivienda:ftpaccess /home/int-davivienda/upload

useradd -m uat-testuser -s /usr/sbin/nologin -G ftpaccess
passwd $1
chown root:root /home/uat-testuser
mkdir /home/uat-testuser/upload
chown uat-testuser:ftpaccess /home/uat-testuser/upload

useradd -m uat-bhd -s /usr/sbin/nologin -G ftpaccess
passwd $1
chown root:root /home/uat-bhd
mkdir /home/uat-bhd/upload
chown uat-bhd:ftpaccess /home/uat-bhd/upload

useradd -m uat-bolivariano -s /usr/sbin/nologin -G ftpaccess
passwd $1
chown root:root /home/uat-bolivariano
mkdir /home/uat-bolivariano/upload
chown uat-bolivariano:ftpaccess /home/uat-bolivariano/upload

useradd -m uat-davivienda -s /usr/sbin/nologin -G ftpaccess
passwd $1
chown root:root /home/uat-davivienda
mkdir /home/uat-davivienda/upload
chown uat-davivienda:ftpaccess /home/uat-davivienda/upload
