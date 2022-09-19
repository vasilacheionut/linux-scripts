echo "Update System"
sudo apt-get update

echo "Install PHP"
sudo apt install php libapache2-mod-php php-mysql

echo "Configure dir.conf and move index.php after DirectoryIndex"
sudo nano /etc/apache2/mods-enabled/dir.conf

echo "Restart Apache Server"
sudo systemctl restart apache2

echo "Verify Apache system service status"
sudo systemctl status apache2

echo "Create test file info.php and add code above"
sudo nano /var/www/html/info.php
echo "<?php phpinfo(); ?>"

echo "Open: localhost/info.php"