echo "Install Apache Web Server"

echo "Update System"
sudo apt-get update

echo "Verify Apache system service status"
sudo systemctl status apache2

echo "If Apache system service not exists install it"
sudo apt install apache2

echo "Check Apache Version"
apache2 -version

echo "Configure the Firewall Settings"
sudo ufw app list
sudo ufw allow 'Apache Full'

echo "Verify Apache system service status"
sudo systemctl status apache2

echo "Verify Hostname IP"
hostname -I


echo "Change owner and make folder read and write"
sudo chown -R www-data:www-data /var/www/html/
sudo chmod 777 /var/www/html/
