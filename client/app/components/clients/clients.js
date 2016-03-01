import angular from 'angular';
import 'angular-ui-router';
import clientsComponent from './clients.component';

let clientsModule = angular.module('clients', [
	'ui.router'
])
.config(($stateProvider)=>{
  $stateProvider
    .state('clients', {
      url: '/clients',
      template: '<clients></clients>',
      data: {
        displayname: 'Our clients',
        showinnav: true
      }
    });
})
.directive('clients', clientsComponent);

export default clientsModule;