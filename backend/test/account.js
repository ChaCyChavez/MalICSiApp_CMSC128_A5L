'use strict';

const config    = require(__dirname + '/../config/config');
const should    = require('chai').should();
const assert    = require('chai').expect();
const request   = require('supertest');

let api         = request(config.APP_URL);


function todo() {
    assert(false, 'method not yet implemented');
}

// one "describe" corresponds to one function in a controller
describe('Account (login)', () => {
    // the "it" are ALL THE POSSIBLE CASES

    // you should check the controller for the their attributes of the returned object then use them for the test

    // base all your test with this example
    it('should not login with incorrect username', (done) => {
        api.post('/api/login-account')
            .send('username=asdfg&password=asdfg')
            .expect(401)
            .end((err, res) => {
                should.not.exist(err);          // these two
                should.exist(res);              // are always existing at the call of the end function
                done();                         // DO NOT FORGET TO CALL THE DONE CALLBACK WHEN THE MODULE TEST IS DONE
            });
    });
});