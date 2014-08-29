'use strict';

modulejs.define('models/list', ['Backbone', 'validators/list'], function(Backbone, ListValidator){

  var List = Backbone.Model.extend({
    defaults: {
      name: 'New List'
    },
    urlRoot: '/list'
  });

  List.validate = ListValidator;

  return List;

});