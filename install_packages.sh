#!/bin/bash

set -e

echo "[INFO] Updating package lists and installing locales..."
sudo apt update -y && sudo apt install -y locales

echo "[INFO] Generating locale en_US.UTF-8..."
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

echo "[INFO] Installing software-properties-common..."
sudo apt install -y software-properties-common

echo "[INFO] Adding universe repository..."
sudo add-apt-repository -y universe

echo "[INFO] Updating package lists and installing curl..."
sudo apt update -y && sudo apt install -y curl

echo "[INFO] Downloading ROS key..."
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "[INFO] Adding ROS2 repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

echo "[INFO] Updating and upgrading system..."
sudo apt update -y && sudo apt upgrade -y

echo "[INFO] Installing ROS Jazzy desktop and dev tools..."
sudo apt install -y ros-jazzy-desktop ros-dev-tools

echo "[INFO] Adding ROS setup to .bashrc..."
echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc

echo "[INFO] Checking ROS2 installation..."
echo "[INFO] ROS_DISTRO: $ROS_DISTRO"

echo "[INFO] Installing additional ROS packages..."
sudo apt-get install -y ros-jazzy-ros2-control
sudo apt-get install -y ros-jazzy-ros2-controllers
sudo apt-get install -y ros-jazzy-xacro
sudo apt-get install -y ros-jazzy-ros-gz-*
sudo apt-get install -y ros-jazzy-*-ros2-control
sudo apt-get install -y ros-jazzy-joint-state-publisher-gui
sudo apt-get install -y ros-jazzy-turtlesim
sudo apt-get install -y ros-jazzy-robot-localization
sudo apt-get install -y ros-jazzy-joy
sudo apt-get install -y ros-jazzy-joy-teleop
sudo apt-get install -y ros-jazzy-tf-transformations

sudo apt-get install -y python3-pip
sudo apt-get install -y python3-transforms3d

echo "[INFO] ROS installation and setup complete."