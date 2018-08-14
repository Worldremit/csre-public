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
echo "ChrootDirectory %h" >> /etc/ssh/sshd_config
echo "AllowTcpForwarding no" >> /etc/ssh/sshd_config
echo "ForceCommand internal-sftp" >> /etc/ssh/sshd_config

systemctl restart ssh #-- restart to pick up config changes from sshd_config update

adduser dev-testuser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo dev-testuser:$1) | chpasswd
usermod -a -G ftpaccess dev-testuser
chmod u=rwx,g=rx,o=rx /home/dev-testuser
mkdir /home/dev-testuser/upload
chown root:root /home/dev-testuser/upload
chown -R dev-testuser:ftpaccess /home/dev-testuser/upload

adduser dev-bhd --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo dev-bhd:$1) | chpasswd
usermod -a -G ftpaccess dev-bhd
chmod u=rwx,g=rx,o=rx /home/dev-bhd
mkdir /home/dev-bhd/upload
chown root:root /home/dev-bhd/upload
chown -R dev-bhd:ftpaccess /home/dev-bhd/upload

adduser dev-bolivariano --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo dev-bolivariano:$1) | chpasswd
usermod -a -G ftpaccess dev-bolivariano
chmod u=rwx,g=rx,o=rx /home/dev-bolivariano
mkdir /home/dev-bolivariano/upload 
chown root:root /home/dev-bolivariano/upload
chown -R dev-bolivariano:ftpaccess /home/dev-bolivariano/upload

adduser dev-davivienda --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo dev-davivienda:$1) | chpasswd
usermod -a -G ftpaccess dev-davivienda
chmod u=rwx,g=rx,o=rx /home/dev-davivienda
mkdir /home/dev-davivienda/upload
chown root:root /home/dev-davivienda/upload
chown -R dev-davivienda:ftpaccess /home/dev-davivienda/upload

adduser int-testuser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo int-testuser:$1) | chpasswd
usermod -a -G ftpaccess int-testuser
chmod u=rwx,g=rx,o=rx /home/int-testuser
mkdir /home/int-testuser/upload
chown root:root /home/int-testuser/upload
chown -R int-testuser:ftpaccess /home/int-testuser/upload

adduser int-bhd --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo int-bhd:$1) | chpasswd
usermod -a -G ftpaccess int-bhd
chmod u=rwx,g=rx,o=rx /home/int-bhd
mkdir /home/int-bhd/upload
chown root:root /home/int-bhd/upload
chown -R int-bhd:ftpaccess /home/int-bhd/upload

adduser int-bolivariano --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo int-bolivariano:$1) | chpasswd
usermod -a -G ftpaccess int-bolivariano
chmod u=rwx,g=rx,o=rx /home/int-bolivariano
mkdir /home/int-bolivariano/upload
chown root:root /home/int-bolivariano/upload
chown -R int-bolivariano:ftpaccess /home/int-bolivariano/upload

adduser int-davivienda --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo int-davivienda:$1) | chpasswd
usermod -a -G ftpaccess int-davivienda
chown root:root /home/int-davivienda
chmod u=rwx,g=rx,o=rx /home/int-davivienda
mkdir /home/int-davivienda/upload
chown -R int-davivienda:ftpaccess /home/int-davivienda/upload

adduser uat-testuser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo uat-testuser:$1) | chpasswd
usermod -a -G ftpaccess uat-testuser
chmod u=rwx,g=rx,o=rx /home/uat-testuser
mkdir /home/uat-testuser/upload
chown root:root /home/uat-testuser/upload
chown -R uat-testuser:ftpaccess /home/uat-testuser/upload

adduser uat-bhd --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo uat-bhd:$1) | chpasswd
usermod -a -G ftpaccess uat-bhd
chmod u=rwx,g=rx,o=rx /home/uat-bhd
mkdir /home/uat-bhd/upload
chown root:root /home/uat-bhd/upload
chown -R uat-bhd:ftpaccess /home/uat-bhd/upload

adduser uat-bolivariano --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo uat-bolivariano:$1) | chpasswd
usermod -a -G ftpaccess uat-bolivariano
chmod u=rwx,g=rx,o=rx /home/uat-bolivariano
mkdir /home/uat-bolivariano/upload
chown root:root /home/uat-bolivariano/upload
chown -R uat-bolivariano:ftpaccess /home/uat-bolivariano/upload

adduser uat-davivienda --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo uat-davivienda:$1) | chpasswd
usermod -a -G ftpaccess uat-davivienda
chmod u=rwx,g=rx,o=rx /home/uat-davivienda
mkdir /home/uat-davivienda/upload
chown root:root /home/uat-davivienda/upload
chown -R uat-davivienda:ftpaccess /home/uat-davivienda/upload
