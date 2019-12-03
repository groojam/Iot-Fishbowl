/**
 * 
 */


  var express = require('express'),

      http = require('http'),

      app = express(),

      server = http.createServer(app) ;

  var bodyParser = require('body-parser') ;

  var GPIO = require('onoff').Gpio,

      rel1 = new GPIO(17, 'out'),
      rel2 = new GPIO(18, 'out'),
      rel3 = new GPIO(27, 'out');

 

  app.use(bodyParser.json()) ;

  app.use(bodyParser.urlencoded({ extended : false })) ;

 

  app.get('/', function(req, res) {

      res.sendfile('rel_web.html', {root : __dirname }) ;

    }) ;

 

  app.post('/data', function(req, res) {

      var state = req.body.state;
      var divnum = req.body.divnum;

      if (div == '1' && state == 'off') {

          led.writeSync(1) ;

        }

      else if(div == '1' && state == 'on') {

          led.writeSync(0) ;

        }
      if (div == '2' && state == 'off') {

          led.writeSync(1) ;

        }

      else if(div == '2' && state == 'on') {

          led.writeSync(0) ;

        }
      if (div == '3' && state == 'off') {

          led.writeSync(1) ;

        }

      else if(div == '3' && state == 'on') {

          led.writeSync(0) ;

        }
 

      console.log(state) ;

      res.sendfile('led_web.html', {root : __dirname }) ;

    }) ;

 

  server.listen(8000, function() {

      console.log('Express server listenling on port ' + server.address().port) ;

    }) ;

