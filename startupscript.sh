#!/usr/bin/env bash

sudo apt-get update

if ! which git; then
  sudo apt-get -y install git-core
  git config --global user.name "jenkins"
  git config --global user.email "jenkins@risevision.com"
fi

if ! which node; then
  curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

if ! which gulp; then
  npm install -g gulp
fi

if ! which unzip; then
  sudo apt-get install -y unzip
fi

if ! which google-chrome; then
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-*.deb
  sudo apt-get install -f -y
  rm google-chrome-stable_current_amd64.deb
fi

if ! which Xvfb; then
  sudo apt-get install -y xvfb
fi

if ! pidof Xvfb ; then
  Xvfb :10 -screen 0 1024x768x24 &
fi

export DISPLAY=:10
if [ ! -f /etc/profile.d/display.sh ]; then
  echo "export DISPLAY=:10" >> /etc/profile.d/display.sh
  chmod +x /etc/profile.d/display.sh
fi

cd /home/widget-memory-tester
rm -rf rvplayer-installer.sh
wget http://install-versions.risevision.com/rvplayer-installer.sh
chown -R widget-memory-tester:widget-memory-tester rvplayer-installer.sh
chmod +x rvplayer-installer.sh
yes | ./rvplayer-installer.sh

rm -rf widget-memory-tester
git clone https://github.com/Rise-Vision/widget-memory-tester.git
chown -R widget-memory-tester:widget-memory-tester widget-memory-tester
cd /home/widget-memory-tester/widget-memory-tester
npm install
chown -R widget-memory-tester:widget-memory-tester widget-memory-tester