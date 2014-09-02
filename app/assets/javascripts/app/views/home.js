'use strict';

modulejs.define('views/home', [
    'Backbone', 
    '_', 
    'jquery', 
    'templates/home/index'
  ], function(Backbone, _, $, HomeView){

  var HomeView = Backbone.View.extend({

    initialize: function(options){
      
    },

    render: function(){
      var compiled = _.template('testing');
      Backbone.$('#main').append(compiled());
    }

  });

  return HomeView;

});