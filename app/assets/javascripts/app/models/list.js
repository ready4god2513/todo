'use strict';

modulejs.define('models/list', ['Backbone', '_'], function(Backbone, _){

  var List = Backbone.Model.extend({
    defaults: {
      name: 'New List'
    }
  });

  return List;

});