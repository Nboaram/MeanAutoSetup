!#/bin/bash
cd
echo ////////////////////////////////////////////////////////////////
echo            Git Cloning Backend
echo ////////////////////////////////////////////////////////////////
sudo git clone https://github.com/Nboaram/TeamAPoolProjectBackend.git
echo
echo
echo ////////////////////////////////////////////////////////////////
echo            Git Cloning Frontend
echo ////////////////////////////////////////////////////////////////
sudo git clone https://github.com/Nboaram/TeamAPoolProjectUI.git
echo
echo
echo ////////////////////////////////////////////////////////////////
echo            Mongo
echo ////////////////////////////////////////////////////////////////
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start
echo
echo
echo ////////////////////////////////////////////////////////////////
echo            Node.JS
echo ////////////////////////////////////////////////////////////////
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
sudo npm init -y
echo
echo
echo ////////////////////////////////////////////////////////////////
echo            Setting up Services
echo ////////////////////////////////////////////////////////////////
sudo cp ~/MeanAutoSetup/angular.service /etc/systemd/system/angular.service
sudo cp ~/MeanAutoSetup/api.service /etc/systemd/system/api.service
echo
echo
echo ////////////////////////////////////////////////////////////////
echo            Starting API
echo ////////////////////////////////////////////////////////////////
cd ~/TeamAPoolProjectBackend
sudo git checkout Developer 
sudo npm install -y
sudo systemctl daemon-reload
sudo systemctl enable api
sudo systemctl start api
echo
echo
echo ////////////////////////////////////////////////////////////////
echo            Starting Angular
echo ////////////////////////////////////////////////////////////////
cd ~/TeamAPoolProjectUI
sudo git checkout Developer
sudo npm install -y
yes | sudo npm -g install --save @angular/cli
sudo systemctl daemon-reload
sudo systemctl enable angular
sudo systemctl start angular
