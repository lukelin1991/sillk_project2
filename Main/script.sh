#!/bin/bash
apt-get update -y
apt-get upgrade -y
sud
systemctl restart apache2
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz
rm latest.tar.gz
chown -R www-data:www-data wordpress
cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i "s/database_name_here/team3/g" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/bjgomes/g" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/P@ssw0rd1234!!/g" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/conoco-project2.mysql.database.azure.com/g" /var/www/html/wordpress/wp-config.php
systemctl restart apache2


cat <<EOL > /etc/apache2/sites-available/wordpress.conf 
<VirtualHost *:80>
    ServerAdmin webmaster@172.178.28.42
    ServerName 172.178.28.42
    DocumentRoot /var/www/html/wordpress
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOL
# Enable the WordPress site and disable the default Apache site
a2dissite 000-default
a2ensite wordpress
# Restart Apache
systemctl restart apache2

