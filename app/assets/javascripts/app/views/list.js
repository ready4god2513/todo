'use strict';

modulejs.define('views/list', ['Backbone', 'jquery', 'collections/list'], function(Backbone, $, List){

  var ListView = Backbone.View.extend({

    initialize: function(options){
      this.collection = new List();
      this.listenTo(this.collection, 'sync', this.render);
      this.collection.fetch();
    },

    render: function(){
      this.collection.forEach(function(item){
        console.log(item.get('name'));
      });
    }

  });

  return ListView;

});