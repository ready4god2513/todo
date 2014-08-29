'use strict';

modulejs.define('_', _);
modulejs.define('Backbone', Backbone);
modulejs.define('jquery', $);

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