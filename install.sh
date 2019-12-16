#!/bin/bash

## Set variables
privateIp=$(hostname -I | awk '{print$1}')
publicIP=$(hostname -I | awk '{print$2}')

## Prevent locale warnings
touch /var/lib/cloud/instance/locale-check.skip

## Update and upgrade system
DEBIAN_FRONTEND=noninteractive apt-get update
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
DEBIAN_FRONTEND=noninteractive apt-get install nginx unzip mysql-server build-essential git curl wget apt-transport-https -y

## Install nodejs (10.x recommended for Ghost)
curl -sL https://deb.nodesource.com/setup_10.x | bash -
DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

## Set passwords
root_mysql_pass=$(openssl rand -hex 24)
ghost_mysql_pass=$(openssl rand -hex 24)

## Create Ghost database
mysqladmin -u root -h localhost create ghost_production 2>/dev/null
mysqladmin -u root -h localhost password ${root_mysql_pass} 2>/dev/null

## Create the Ghost MySQL user and grant permissions to them
mysql -uroot -p${root_mysql_pass} -e "CREATE USER 'ghost'@'localhost' IDENTIFIED BY '${ghost_mysql_pass}'" 2>/dev/null
mysql -uroot -p${root_mysql_pass} -e "GRANT ALL PRIVILEGES ON ghost_production.* TO ghost@localhost" 2>/dev/null

## Set up Ghost users/permissions 
groupadd ghost-mgr
useradd -m -g ghost-mgr -G sudo -s /bin/bash ghost-mgr
passwd -d ghost-mgr
echo "ghost-mgr ALL=(ALL) NOPASSWD:ALL" /etc/sudoers.d/99-ghost
mkdir /var/www/ghost
chmod 0775 /var/www/ghost
chown -R ghost-mgr: /var/www/ghost

## Install latest version of Ghost CLI
echo "Ensuring Ghost-CLI is up-to-date..."
su ghost-mgr -c "bash -x <<EOM
sudo npm i -g ghost-cli@latest
EOM"

## Install Ghost
echo "Installing Ghost..."
su ghost-mgr -c "bash -x <<EOM
sudo -iu ghost-mgr ghost install --auto --db=mysql --url="http://${publicIP}" --dbhost=localhost --dbname=ghost_production --dbuser=ghost --dbpass=${ghost_mysql_pass} --dir=/var/www/ghost --start
EOM"

## Remove default Nginx site and restart service
rm -f /etc/nginx/sites-enabled/default
systemctl restart nginx