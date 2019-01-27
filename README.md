echo "Update apt-get"
sudo apt-get update
echo "Upgrade apt-get"
sudo apt-get upgrade
echo "Enable the camera"
sed -i '/start_x=0/c\start_x=1' /boot/config.txt



