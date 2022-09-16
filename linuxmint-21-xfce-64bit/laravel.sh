  php -m

echo "Install Laravel's PHP dependencies with the command:"

sudo apt-get install php-bcmath
sudo apt-get install php-xml

echo "Enable the Apache module mod_rewrite:"
sudo a2enmod rewrite

echo "Restart Apache:"
sudo service apache2 restart




echo "Use Composer to download the Laravel installer:"
composer global require laravel/installer

echo "Note: Because Composer is never run as root, it is not necessary to use sudo for Composer commands."

echo "Update Your PATH"

echo "You will want to update the PATH for your Composer user so that you can use the laravel command. To do this, go to your user's home directory:"

cd ~/

echo "Open the .profile file for editing:"

nano .profile

echo '
Find the following lines:

# set PATH so it includes users private bin directories
  PATH="$HOME/bin:$HOME/.local/bin:$PATH"

Add $HOME/.config/composer/vendor/bin: to the second line so that it reads:

# set PATH so it includes users private bin directories

PATH="$HOME/.config/composer/vendor/bin:$HOME/bin:$HOME/.local/bin:$PATH"

Save and exit the file. 
'

echo "Then use source to update the PATH information:"
source .profile




echo "You could also find the composers global installation path by running:"
composer global about 

echo "You can now use the laravel command to create a new project:"
laravel new my-project

echo "Create-Project via Composer"
composer create-project --prefer-dist laravel/laravel blog

echo "Copy (cp) or Move (mv) project:"
sudo cp -R blog/ /var/www/html/

echo "Set the necessary permissions to ensure the project runs smoothly:"
sudo chgrp -R www-data /var/www/html/blog
sudo chmod -R 775 /var/www/html/blog/storage



echo "It is necessary to create a new virtual host for the project:"
cd /etc/apache2/sites-available
sudo nano blog.conf

echo "Add the following to create the new Virtual host:
  see at : [12.22] - https://youtu.be/MAApnlVz6OY?t=744

  sudo a2dissite 000-default.conf
  sudo systemctl reload apache2

Afterwards, enable the new virtual host:
  sudo a2ensite blog.conf
  sudo systemctl reload apache2

Enable the Apache rewrite module, and finally, restart the Apache service:
  sudo a2enmod rewrite
  sudo systemctl restart apache2"