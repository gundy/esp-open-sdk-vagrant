
# ==================================================================================
#  INSTALL pfalcon:esp-open-sdk
# ==================================================================================

# based on instructions at https://github.com/pfalcon/esp-open-sdk
# .. and here: https://forum.micropython.org/viewtopic.php?t=1965

# update apt-get repo details
sudo apt-get -y update

# Install required dependencies
sudo apt-get -y install git autoconf build-essential
sudo apt-get -y install gperf bison flex texinfo libtool libncurses5-dev wget gawk python-serial libexpat-dev dpkg-dev unzip
sudo apt-get -y install help2man python python2.7-dev

# for ftdi/usb serial drivers
sudo apt-get -y install linux-image-extra-virtual
 
# Install the esp-open-sdk toolchain
cd /opt
sudo git clone --recursive https://github.com/pfalcon/esp-open-sdk.git
sudo chown -R vagrant esp-open-sdk
cd esp-open-sdk
make STANDALONE=y

# configure profile 
echo 'PATH=$PATH:/opt/esp-open-sdk/xtensa-lx106-elf/bin' >> ~/.profile
echo 'PATH=$PATH:/opt/esp-open-sdk/esptool' >> ~/.profile
PATH=$PATH:/opt/esp-open-sdk/xtensa-lx106-elf/bin
PATH=$PATH:/opt/esp-open-sdk/esptool
 
# grant access to serial port
sudo adduser vagrant dialout





# ==================================================================================
#  INSTALL SmingHub:Sming
# ==================================================================================

# prepare for install of sming - install dependencies
sudo apt-get install -y \
              make unrar autoconf automake libtool gcc g++ gperf flex bison texinfo \
              gawk ncurses-dev libexpat1-dev python sed python-serial python-dev \
              srecord bc git help2man

# create /opt folder
sudo mkdir -p /opt

# check out the Sming repo from github
cd /opt
sudo git clone https://github.com/SmingHub/Sming.git
sudo chown -R vagrant /opt/Sming

# ----------------------------------------------------------------------------
#  to checkout stable branch rather than develop, uncomment below two lines
# ----------------------------------------------------------------------------
# cd /opt/Sming
# git checkout origin/master
# -----------------------------

export ESP_HOME=/opt/esp-open-sdk
export SMING_HOME=/opt/Sming/Sming

cd $SMING_HOME
make


make spiffy

echo 'export ESP_HOME=/opt/esp-open-sdk' >> ~/.profile
echo 'export SMING_HOME=/opt/Sming/Sming' >> ~/.profile



# ==================================================================================
#  INSTALL raburton:esptool2
# ==================================================================================

# create /opt folder
sudo mkdir -p /opt

# check out the Sming repo from github
cd /opt
sudo git clone https://github.com/raburton/esptool2.git
sudo chown -R vagrant /opt/esptool2

cd /opt/esptool2
make

echo 'PATH=$PATH:/opt/esptool2' >> ~/.profile

