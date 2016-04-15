#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y

# https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-service.html

sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java8-installer -y

# https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-repositories.html

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb http://packages.elastic.co/elasticsearch/1.7/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-1.7.list
sudo apt-get update && sudo apt-get install elasticsearch
sudo update-rc.d elasticsearch defaults 95 10

# make sure elasticsearch is running

if [ -f /var/run/elasticsearch/elasticsearch.pid ]
then
     sudo /etc/init.d/elasticsearch start
     sleep 10
else

	# make sure elasticsearch is actually running...
	PID=`cat /var/run/elasticsearch/elasticsearch.pid`
	# ps -p ${PID}
fi

exit 0
