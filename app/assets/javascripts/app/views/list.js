'use strict';

modulejs.define('views/list', [
  '_',
  'Backbone', 
  'collections/list',
  'templates/lists/index',
  'templates/lists/single',
  ], function(_, Backbone, List, ListIndex, ListSingleView){

  var ListView = Backbone.View.extend({

    initialize: function(options){
      this.collection = new List();
      this.listenTo(this.collection, 'sync', this.render);
      this.collection.fetch();
      Backbone.$('#main').html(ListIndex);
    },

    render: function(){
      this.collection.forEach(function(item){
        var compiled = _.template(ListSingleView);
        Backbone.$('#main .lists').append(compiled(item.attributes));
      });
    }

  });

  return ListView;

});