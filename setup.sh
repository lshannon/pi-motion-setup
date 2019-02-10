echo "Setting Up A Stock Stretch OS Installation"
echo "Update apt-get"
sudo apt-get update
echo "Upgrade apt-get"
sudo apt-get upgrade
echo "Enable the camera"
sudo sh -c "sed -i '/start_x=0/c\start_x=1' /boot/config.txt"
echo "Install Motion"
sudo apt-get install motion
echo "Activate the driver"
sudo modprobe bcm2835-v4l2
echo "Ensure the drive is activated after every reboot"
echo 'bcm2835-v4l2' | sudo tee --append /etc/modules
echo "Turn on the camera as a background process"
sudo sh -c "sed -i '/start_motion_daemon=no/c\start_motion_daemon=yes' /etc/default/motion"
echo "Back up the motion.conf file"
sudo cp /etc/motion/motion.conf /etc/motion/motion.conf.bak
sudo sh -c "sed -i '/daemon off/c\daemon an' /etc/motion/motion.conf"
sudo sh -c "sed -i '/width 320/c\width 640' /etc/motion/motion.conf"
sudo sh -c "sed -i '/height 240/c\height 480' /etc/motion/motion.con"
stream_quality 50 stream_quality 90
stream_localhost on stream_localhost off
framerate 2 framerate 1000






