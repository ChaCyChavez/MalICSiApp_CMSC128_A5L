# MalICSiApp_CMSC128_A5L
MalICSi App
============
```
A repository of CMSC 128 A-5L students for their "MalICSi App" ( a web-based application that is used for managing and scheduling sports events and tournaments )
```
## Prerequisites
------------
```
* MariaDB for Database
* `sudo apt install npm`
* `sudo npm install -g nodemon`
* `sudo npm install -g gulp`
* `sudo npm install -g bower`
* `sudo npm install -g n`
* `sudo n stable` This part makes sure that our NodeJS version is the stable one.
* The command "sudo n latest" will download the latest version of Node.js and if the version is not the latest after running the command, run `sudo ln -sf /usr/local/n/versions/node/7.7.2/bin/node /usr/bin/node` 
```
## Command(s)
------------
```
* `git clone https://github.com/EddieVallejos/MalICSiApp_CMSC128_A5L.git`
* `cd MalICSiApp_CMSC128_A5L`

To obtain packages that the back-end will be using..
* `npm install`

To obtain packages that the front-end will be using..
* `cd frontend`
* `bower install`

To add npm packages to package.json..
* `npm install --save <package>`

To add npm packages to bower.json..
* `bower install <package> --save`
```

## To start the web server
------------
```
* `npm start` or `sudo npm start` 

then check http://localhost:8000
```
## Conventions
------------
``` For the back-end part ```

1. Use snake_case for variable names

	e.g.:
	const login_session;

2. Don't exceed the 80th column. If the statement is going to exceed, put it in the newline with 2 tabs first, Eg.

	if (condition1 && condition2 &&
	<TAB><TAB>condition3)

3. For syntax of if, while, functions, etc., follow this format:

	if (condition) 
	{
		// statements here
	}

	else if (condition) 
	{

	}
4. Always use spaces for indention instead of tabs. (To distinguish the 80th column)

5. For controllers, follow the 'known function' convention for callbacks

6. Always add comment to your created function. This is not your solo code. Let other devs know what is the purpose of your function

``` For the front-end part ```
```
* TLs of front-end will be the one who will decide for their conventions.

```

