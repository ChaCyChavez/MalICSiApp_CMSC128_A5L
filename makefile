build:
	reset
	sudo apt-get install redis-server
	sudo npm install
	sudo npm install -g nodemon
	sudo npm install -g gulp
	sudo npm install -g bower
	sudo npm install -g n
	sudo n stable

run:
	reset
	sudo npm start
