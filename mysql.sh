echo 'Install MySQL'
sudo apt install mysql-server 


sudo mysql

echo "
    SELECT user,authentication_string,plugin,host FROM mysql.user;

    ALTER USER 'root'@'localhost' 
    IDENTIFIED WITH mysql_native_password 
    BY 'Test54321@';

    SELECT user,authentication_string,plugin,host FROM mysql.user;
    exit;
"

mysql -u root -p
