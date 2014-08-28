'use strict';

modulejs.define('models/todo', ['Backbone', '_'], function(Backbone, _){

  var Todo = Backbone.Model.extend({
    defaults: {
      name: '',
      completed: false
    }
  });

  return Todo;

});