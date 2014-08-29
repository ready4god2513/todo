'use strict';

modulejs.define('models/todo', ['Backbone'], function(Backbone){

  var Todo = Backbone.Model.extend({
    defaults: {
      name: '',
      completed: false
    },
    urlRoot: '/todo'
  });

  return Todo;

});