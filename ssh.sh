echo "Install SSH on client and server:  https://www.youtube.com/watch?v=RvSWpsNlayo"

echo "Update System"
sudo apt-get update

echo "Install openssh-client"
sudo apt install openssh-client


echo "Or if whant to be server Install openssh-server that include and openssh-client"
sudo apt install openssh-client


echo "Connect to server"
ssh learnlinux@192.168.1.144