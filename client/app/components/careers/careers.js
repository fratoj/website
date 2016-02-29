import angular from 'angular';
import 'angular-ui-router';
import careersComponent from './careers.component';

let careersModule = angular.module('careers', [
	'ui.router'
])
.config(($stateProvider)=>{
  $stateProvider
    .state('careers', {
      url: '/careers',
      template: '<careers></careers>',
      data: {
        displayname: 'Careers'
      }
    });
})
.directive('careers', careersComponent);

export default careersModule;