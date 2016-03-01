import angular from 'angular';
import 'angular-ui-router';
import contactComponent from './contact.component';

let contactModule = angular.module('contact', [
	'ui.router'
])
.config(($stateProvider)=>{
  $stateProvider
    .state('contact', {
      url: '/contact',
      template: '<contact></contact>',
      data: {
        displayname: 'Contact',
        showinnav: true
      }
    });
})
.directive('contact', contactComponent);

export default contactModule;