'use strict';

modulejs.define('_', function(){
  return _;
});

modulejs.define('jquery', function(){
  return jQuery;
});

modulejs.define('Backbone', Backbone);


modulejs.define('main', ['routers/main'], function(Router){
  return {
    start: function(){
      var router = new Router();
    }
  };
});

$(function(){
  var app = modulejs.require('main');
  app.start();
});