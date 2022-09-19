sudo apt install apache2 wget unzip 
sudo apt install php php-zip php-json php-mbstring php-mysql 

sudo systemctl enable apache2 
sudo systemctl start apache2 


wget https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.zip 
unzip phpMyAdmin-5.2.0-all-languages.zip 
sudo mv phpMyAdmin-5.2.0-all-languages /usr/share/phpmyadmin 

sudo mkdir /usr/share/phpmyadmin/tmp 
sudo chown -R www-data:www-data /usr/share/phpmyadmin 
sudo chmod 777 /usr/share/phpmyadmin/tmp

sudo nano /etc/apache2/conf-available/phpmyadmin.conf 


Alias /phpmyadmin /usr/share/phpmyadmin
Alias /phpMyAdmin /usr/share/phpmyadmin
 
<Directory /usr/share/phpmyadmin/>
   AddDefaultCharset UTF-8
   <IfModule mod_authz_core.c>
      <RequireAny>
      Require all granted
     </RequireAny>
   </IfModule>
</Directory>
 
<Directory /usr/share/phpmyadmin/setup/>
   <IfModule mod_authz_core.c>
     <RequireAny>
       Require all granted
     </RequireAny>
   </IfModule>
</Directory>


sudo a2enconf phpmyadmin 
sudo systemctl restart apache2 

sudo firewall-cmd --permanent --add-service=http 
sudo firewall-cmd --reload 

http://your-server-ip-domain/phpmyadmin

http://localhost/phpmyadmin


Fix

 The phpMyAdmin configuration storage is not completely configured, some extended features have been deactivated. Find out why.
Or alternately go to 'Operations' tab of any database to set it up there. 


http://localhost/phpmyadmin/index.php?route=/check-relations



phpMyAdmin configuration storage Documentation

Configuration of pmadb… not OK Documentation

General relation features Disabled
Create a database named 'phpmyadmin' and setup the phpMyAdmin configuration storage there.


The configuration file now needs a secret passphrase (blowfish_secret).
You’ll see this error after every installation of phpmyadmin.
To resolve this issue, just open config.inc.php ( or rename config.sample.inc.php to config.inc.php if you haven’t done so yet ) and change this line

Open Terminal

cd /usr/share/phpmyadmin/
sudo cp config.sample.inc.php config.inc.php

sudo nano config.inc.php

Replace 

$cfg['blowfish_secret'] = ''; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

to

$cfg['blowfish_secret'] = 'P5DS+radU0TOqI7HX$cH!eb3zwnDDoDr';