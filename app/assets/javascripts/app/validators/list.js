'use strict';

modulejs.define('validators/list', function(List){

  var ListValidator = function(attrs){
    if(!attrs.name){
      return 'The list name is required';
    }
  };

  return ListValidator;
});