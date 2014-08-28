modulejs.define('_', _);
modulejs.define('Backbone', Backbone);

modulejs.define('main', ['_', 'Backbone'], function(_, Backbone){
  return {
    start: function(){
      modulejs.require('models/todo');
    }
  };
});

$(function(){
  var app = modulejs.require('main');
  app.start();
});