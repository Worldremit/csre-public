apt-get update   #-- check for updates
apt-get install openssh-server #-- install SFTP
cp /etc/vsftpd.conf /etc/vsftpd.conf.bk #-- backup config
addgroup ftpaccess #-- create group for SFTP users

#/etc/ssh/sshd_config --> needs to be added to file following amends to bottom --> 

echo "" >> /etc/ssh/sshd_config
echo "" >> /etc/ssh/sshd_config
echo "#Subsystem sftp internal-sftp" >> /etc/ssh/sshd_config
echo "X11Forwarding no" >> /etc/ssh/sshd_config
echo "Match group ftpaccess" >> /etc/ssh/sshd_config
echo "ChrootDirectory /home/%u/upload" >> /etc/ssh/sshd_config
echo "AllowTcpForwarding no" >> /etc/ssh/sshd_config
echo "ForceCommand internal-sftp" >> /etc/ssh/sshd_config

systemctl restart ssh #-- restart to pick up config changes from sshd_config update

adduser dev-testuser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo dev-testuser:$1) | chpasswd
usermod -a -G ftpaccess dev-testuser
chown root:root /home/dev-testuser
chmod go-w /home/dev-testuser
mkdir /home/dev-testuser/upload
chown dev-testuser:ftpaccess /home/dev-testuser/upload

adduser dev-bhd --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo dev-bhd:$1) | chpasswd
usermod -a -G ftpaccess dev-bhd
chown root:root /home/dev-bhd
chmod go-w /home/dev-bhd
mkdir /home/dev-bhd/upload
chown dev-bhd:ftpaccess /home/dev-bhd/upload

adduser dev-bolivariano --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo dev-bolivariano:$1) | chpasswd
usermod -a -G ftpaccess dev-bolivariano
chown root:root /home/dev-bolivariano
chmod go-w /home/dev-bolivariano
mkdir /home/dev-bolivariano/upload
chown dev-bolivariano:ftpaccess /home/dev-bolivariano/upload

adduser dev-davivienda --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo dev-davivienda:$1) | chpasswd
usermod -a -G ftpaccess dev-davivienda
chown root:root /home/dev-davivienda
chmod go-w /home/dev-davivienda
mkdir /home/dev-davivienda/upload
chown dev-davivienda:ftpaccess /home/dev-davivienda/upload

adduser int-testuser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo int-testuser:$1) | chpasswd
usermod -a -G ftpaccess int-testuser
chown root:root /home/int-testuser
chmod go-w /home/int-testuser
mkdir /home/int-testuser/upload
chown int-testuser:ftpaccess /home/int-testuser/upload

adduser int-bhd --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo int-bhd:$1) | chpasswd
usermod -a -G ftpaccess int-bhd
chown root:root /home/int-bhd
chmod go-w /home/int-bhd
mkdir /home/int-bhd/upload
chown int-bhd:ftpaccess /home/int-bhd/upload

adduser int-bolivariano --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo int-bolivariano:$1) | chpasswd
usermod -a -G ftpaccess int-bolivariano
chown root:root /home/int-bolivariano
chmod go-w /home/int-bolivariano
mkdir /home/int-bolivariano/upload
chown int-bolivariano:ftpaccess /home/int-bolivariano/upload

adduser int-davivienda --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo int-davivienda:$1) | chpasswd
usermod -a -G ftpaccess int-davivienda
chown root:root /home/int-davivienda
chmod go-w /home/int-davivienda
mkdir /home/int-davivienda/upload
chown int-davivienda:ftpaccess /home/int-davivienda/upload

adduser uat-testuser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo uat-testuser:$1) | chpasswd
usermod -a -G ftpaccess uat-testuser
chown root:root /home/uat-testuser
chmod go-w /home/uat-testuser
mkdir /home/uat-testuser/upload
chown uat-testuser:ftpaccess /home/uat-testuser/upload

adduser uat-bhd --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo uat-bhd:$1) | chpasswd
usermod -a -G ftpaccess uat-bhd
chown root:root /home/uat-bhd
chmod go-w /home/uat-bhd
mkdir /home/uat-bhd/upload
chown uat-bhd:ftpaccess /home/uat-bhd/upload

adduser uat-bolivariano --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo uat-bolivariano:$1) | chpasswd
usermod -a -G ftpaccess uat-bolivariano
chown root:root /home/uat-bolivariano
chmod go-w /home/uat-bolivariano
mkdir /home/uat-bolivariano/upload
chown uat-bolivariano:ftpaccess /home/uat-bolivariano/upload

adduser uat-davivienda --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo uat-davivienda:$1) | chpasswd
usermod -a -G ftpaccess uat-davivienda
chown root:root /home/uat-davivienda
chmod go-w /home/uat-davivienda
mkdir /home/uat-davivienda/upload
chown uat-davivienda:ftpaccess /home/uat-davivienda/upload
