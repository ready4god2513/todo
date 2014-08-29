'use strict';

modulejs.define('views/home', ['Backbone', '_', 'jquery'], function(Backbone, _, $){

  var HomeView = Backbone.View.extend({

    initialize: function(options){
      
    },

    render: function(){
      console.log('got the home render');
    }

  });

  return HomeView;

});