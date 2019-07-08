!#/bin/bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
npm init -y
npm install --save mongoose
npm install --save ex
yes | sudo npm install -g @angular/cli
npm install --save-dev @angular-devkit/build-angular
npm install --save bootstrap
npm install --save cors
sudo cp angular.service /etc/systemd/system/angular.service
sudo cp api.service /etc/systemd/system/api.service
cd /TeamAPoolProjectBackend
git checkout Developer 
sudo systemctl daemon-reload
sudo systemctl enable api
sudo systemctl start api
cd /TeamAPoolProjectUI
git checkout Developer
sudo systemctl daemon-reload
sudo systemctl enable angular
sudo systemctl start angular
ng serve
