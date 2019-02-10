echo "Setting Up A Stock Stretch OS Installation"
echo "Update apt-get"
sudo apt-get update
echo "Upgrade apt-get"
sudo apt-get upgrade
echo "Enable the camera"
sed -i '/start_x=0/c\start_x=1' /boot/config.txt
echo "Install Motion"
sudo apt-get install motion
echo "Activate the driver"
sudo modprobe bcm2835-v4l2
echo "Ensure the drive is activated after every reboot"
sudo echo 'bcm2835-v4l2' >> /etc/modules
echo "Turn on the camera as a background process"
sudo sed -i '/# start_motion_daemon=yes/c\start_motion_daemon=yes' /etc/default/motion
echo "Back up the motion.conf file"
sudo cp /etc/motion/motion.conf /etc/motion/motion.conf.bak
