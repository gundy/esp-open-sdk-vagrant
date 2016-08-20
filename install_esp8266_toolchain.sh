
# based on instructions at https://github.com/pfalcon/esp-open-sdk
# .. and here: https://forum.micropython.org/viewtopic.php?t=1965

# Install required dependencies
sudo apt-get -y install git autoconf build-essential
sudo apt-get -y install gperf bison flex texinfo libtool libncurses5-dev wget gawk python-serial libexpat-dev dpkg-dev unzip
sudo apt-get -y install help2man python python2.7-dev
 
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

