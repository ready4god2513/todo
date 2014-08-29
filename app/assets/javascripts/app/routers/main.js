'use strict';

modulejs.define('routers/main', [
  'Backbone',
  'views/list',
  'views/home',
  'views/todo',
  ], function(Backbone, ListView, HomeView, TodoView){

  var Router = Backbone.Router.extend({
    routes: {
      '': 'home',
      'lists': 'lists',
      'list/:id': 'showList',
      'list/:listId/todos': 'todos'
    },

    initialize: function(){
      Backbone.history.start();
    },

    home: function(){
      var homeView = new HomeView();
      homeView.render();
    },

    lists: function(){
      var listView = new ListView();
      listView.render();
    },

    showList: function(id){

    },

    todos: function(listId){

    }
  });

  return Router;

});