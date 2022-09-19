echo 'Install MySQL'
sudo apt install mysql-server 

echo "
    SELECT user,authentication_string,plugin,host FROM mysql.user;

    ALTER USER 'root'@'localhost' 
    IDENTIFIED WITH mysql_native_password 
    BY 'Test54321@';

    SELECT user,authentication_string,plugin,host FROM mysql.user;
    mysql -u root -p
"

sudo mysql
mysql -u root -p
