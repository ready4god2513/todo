'use strict';

modulejs.define('collections/list', ['Backbone', 'models/list'], function(Backbone, List){

  var ListCollection = Backbone.Collection.extend({
    model: List,
    url: '/lists',
    parse: function(response){
      return response.lists;
    }
  });

  return ListCollection;

});