sudo locale-gen UTF-8

export LC_ALL="en_US.UTF-8"

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

#sudo add-apt-repository -y ppa:webupd8team/java

sudo add-apt-repository ppa:openjdk-r/ppa

echo "\r\nUpdate system ...\r\n"

sudo apt-get -y update

echo "\r\nInstall unzip, chrome, java, xvfb ...\r\n"

sudo apt-get -y install xvfb

sudo apt-get -y install zip unzip

sudo apt-get -y install google-chrome-stable

#echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
#echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

#sudo apt-get -y install oracle-java8-set-default

sudo apt-get -y install openjdk-8-jre


#echo "\r\nDownload chromedriver and selenium-server ...\r\n"

#wget "https://github.com/groupon/Selenium-Grid-Extras/releases/download/v1.12.7/SeleniumGridExtras-1.12.7-SNAPSHOT-jar-with-dependencies.jar"
cd /tmp
wget "https://chromedriver.storage.googleapis.com/2.25/chromedriver_linux64.zip"

wget "http://selenium-release.storage.googleapis.com/3.0/selenium-server-standalone-3.0.1.jar"

unzip chromedriver_linux64.zip

sudo mv -f chromedriver /usr/local/share/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

cp /vagrant/nodeconf.json /home/vagrant/
cp selenium-server-standalone-3.0.1.jar /home/vagrant/selenium-hub.jar
cp selenium-server-standalone-3.0.1.jar /home/vagrant/selenium-node.jar

sudo cp /vagrant/hub.conf /etc/init/
sudo cp /vagrant/node.conf /etc/init/



