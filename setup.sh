if [ "$EUID" -ne 0 ]
  then echo "Please run as root: sudo ./setup.sh"
  exit
fi
echo "Before running this script you need to ensure your OS is updated"
echo "The set up of your OS gives you an option to do this"
echo "Otherwise, from the terminal run:"
echo "sudo apt-get update"
echo "sudo apt-get upgrade"
echo "reboot"
echo "If your OS is updated type 'Y' to continue"
read CONFIRMATION
if [ "$CONFIRMATION" != "Y" ]; then
  echo "Script is terminating. Update the OS and reboot, then re-run this"
  exit 0;
fi
echo "Setting Up A Stock Stretch OS Installation To Stream video with Motion"
echo "Enable the camera"
sudo sh -c "sed -i '/start_x=0/c\start_x=1' /boot/config.txt"
echo "Camera Enabled"
echo "Install Motion - You will be prompted to type 'Y' to proceed"
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
sudo sh -c "sed -i '/daemon off/c\daemon on' /etc/motion/motion.conf"
sudo sh -c "sed -i '/width 320/c\width 640' /etc/motion/motion.conf"
sudo sh -c "sed -i '/height 240/c\height 480' /etc/motion/motion.con"
sudo sh -c "sed -i '/stream_quality 50/c\stream_quality 90' /etc/motion/motion.conf"
sudo sh -c "sed -i '/stream_localhost on/c\stream_localhost off' /etc/motion/motion.conf"
sudo sh -c "sed -i '/framerate 2/c\framerate 1000' /etc/motion/motion.conf"
sudo sh -c "sed -i '/webcontrol_localhost on/c\webcontrol_localhost off' /etc/motion/motion.conf"
sudo sh -c "sed -i '/minimum_motion_frames 1/c\minimum_motion_frames 5' /etc/motion/motion.conf"
echo "Script Completed"
echo "Any errors will appear above"
echo "Reboot to start using the camera"
