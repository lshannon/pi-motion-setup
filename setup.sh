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
echo "Configure Motion for stream"
sudo sh -c "sed -i '/daemon off/c\daemon an' /etc/motion/motion.conf"
sudo sh -c "sed -i '/width 320/c\width 640' /etc/motion/motion.conf"
sudo sh -c "sed -i '/height 240/c\height 480' /etc/motion/motion.con"
sudo sh -c "sed -i '/stream_quality 50/c\stream_quality 90' /etc/motion/motion.conf"
sudo sh -c "sed -i '/stream_localhost on/c\stream_localhost off' /etc/motion/motion.conf"
sudo sh -c "sed -i '/framerate 2/c\framerate 1000' /etc/motion/motion.conf"






