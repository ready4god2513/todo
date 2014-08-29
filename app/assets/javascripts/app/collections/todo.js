'use strict';

modulejs.define('collections/todo', ['Backbone', 'models/todo'], function(Backbone, Todo){

  var TodoCollection = Backbone.Collection.extend({
    model: Todo,
    url: '/todos'
  });

  return TodoCollection;

});