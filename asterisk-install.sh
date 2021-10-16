sudo apt update && sudo apt upgrade
sudo apt install wget build-essential subversion
cd /usr/src/
sudo wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-18-current.tar.gz
sudo tar zxf asterisk-18-current.tar.gz
cd asterisk-18.*/
sudo contrib/scripts/get_mp3_source.sh
sudo contrib/scripts/install_prereq install
sudo ./configure

sudo make menuselect
sudo make -j2
sudo make install
sudo make samples
sudo make config
sudo ldconfig

sudo systemctl start asterisk
sudo ufw allow 5060/udp
sudo cp extensions.conf /etc/asterisk
sudo cp sip.conf /etc/asterisk
sudo cp voicemail.conf /etc/asterisk

sudo nano extensions.conf
sudo nano sip.conf
sudo nano voicemail.conf

sudo asterisk -vvvr

module show like sip
module load chan_sip.so

reload

sip show peers

# Thanks

