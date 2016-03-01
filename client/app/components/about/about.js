import angular from 'angular';
import 'angular-ui-router';
import aboutComponent from './about.component';

let aboutModule = angular.module('about', [
	'ui.router'
])
.config(($stateProvider)=>{
	$stateProvider
		.state('about', {
			url: '/about',
			template: '<about></about>',
      data: {
        displayname: 'About us',
        showinnav: true
      }
		});
})
.directive('about', aboutComponent);

export default aboutModule;