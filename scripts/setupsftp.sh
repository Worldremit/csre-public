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
chown root:root /home/dev-testuser
mkdir /home/dev-testuser/upload
chown -R dev-testuser:ftpaccess /home/dev-testuser

adduser dev-bhd --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo dev-bhd:$1) | chpasswd
usermod -a -G ftpaccess dev-bhd
chown root:root /home/dev-bhd
mkdir /home/dev-bhd/upload
chown -R dev-bhd:ftpaccess /home/dev-bhd

adduser dev-bolivariano --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo dev-bolivariano:$1) | chpasswd
usermod -a -G ftpaccess dev-bolivariano
chown root:root /home/dev-bolivariano
mkdir /home/dev-bolivariano/upload 
chown -R dev-bolivariano:ftpaccess /home/dev-bolivariano

adduser dev-davivienda --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo dev-davivienda:$1) | chpasswd
usermod -a -G ftpaccess dev-davivienda
chown root:root /home/dev-davivienda
mkdir /home/dev-davivienda/upload
chown -R dev-davivienda:ftpaccess /home/dev-davivienda

adduser int-testuser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo int-testuser:$1) | chpasswd
usermod -a -G ftpaccess int-testuser
chown root:root /home/int-testuser
mkdir /home/int-testuser/upload
chown -R int-testuser:ftpaccess /home/int-testuser

adduser int-bhd --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo int-bhd:$1) | chpasswd
usermod -a -G ftpaccess int-bhd
chown root:root /home/int-bhd
mkdir /home/int-bhd/upload
chown -R int-bhd:ftpaccess /home/int-bhd

adduser int-bolivariano --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo int-bolivariano:$1) | chpasswd
usermod -a -G ftpaccess int-bolivariano
chown root:root /home/int-bolivariano
mkdir /home/int-bolivariano/upload
chown -R int-bolivariano:ftpaccess /home/int-bolivariano

adduser int-davivienda --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo int-davivienda:$1) | chpasswd
usermod -a -G ftpaccess int-davivienda
chown root:root /home/int-davivienda
mkdir /home/int-davivienda/upload
chown -R int-davivienda:ftpaccess /home/int-davivienda

adduser uat-testuser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo uat-testuser:$1) | chpasswd
usermod -a -G ftpaccess uat-testuser
chown root:root /home/uat-testuser
mkdir /home/uat-testuser/upload
chown -R uat-testuser:ftpaccess /home/uat-testuser

adduser uat-bhd --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo uat-bhd:$1) | chpasswd
usermod -a -G ftpaccess uat-bhd
chown root:root /home/uat-bhd
mkdir /home/uat-bhd/upload
chown -R uat-bhd:ftpaccess /home/uat-bhd

adduser uat-bolivariano --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo uat-bolivariano:$1) | chpasswd
usermod -a -G ftpaccess uat-bolivariano
chown root:root /home/uat-bolivariano
mkdir /home/uat-bolivariano/upload
chown -R uat-bolivariano:ftpaccess /home/uat-bolivariano

adduser uat-davivienda --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
(echo uat-davivienda:$1) | chpasswd
usermod -a -G ftpaccess uat-davivienda
chown root:root /home/uat-davivienda
mkdir /home/uat-davivienda/upload
chown -R uat-davivienda:ftpaccess /home/uat-davivienda
