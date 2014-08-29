'use strict';

modulejs.define('views/todo', ['Backbone', 'jquery'], function(Backbone, $){

  var TodoView = Backbone.View.extend({

    initialize: function(options){
      this.collection = options.collection;
      this.collection.bind('reset', this.render);
    },

    render: function(){
      this.collection.forEach(function(item){
        console.log(item);
      });
    }

  });

  return TodoView;

});