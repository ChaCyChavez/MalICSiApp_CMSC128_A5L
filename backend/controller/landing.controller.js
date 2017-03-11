'use strict'

const db = require(__dirname + '/../lib/mariasql');

exports.login = (req, res, next) => {
    
    const data = {
        username: req.query.username,
        password: req.query.password
    }

    function start(){
       const query = "select * from user where username = BINARY ? AND password = BINARY ?";
       db.query(query, [data.username, data.password], send_response);
    }

    function send_response(err, result, args, last_query){
        if(err){
        	next(err);
            return res.status(500).send(err);
        }
        else if(!result.length) {
			console.log('Wrong username or password...');
            return res.status(404).send({message: 'Wrong username or password.'});
        } else if (req.session.user != undefined && req.session.user.username != result[0].username){
            console.log('Login session is not yet finished.');
            return res.status(404).send({message: 'Login session is not yet finished.'});
        } else{
            req.session.user = {
                chitter_name: result[0].chitter_name,
                user_id: result[0].user_id,
                username: result[0].username,
                password: result[0].password
            }
            console.log('SUCCESSFULLY LOGGED IN!');
            return res.send({message: "Successfully logged in!"});
        }
    }
    
    start();
}