import angular from 'angular';
import 'angular-ui-router';
import headerComponent from './header.component';

let headerModule = angular.module('header', [
	'ui.router'
])
.directive('header', headerComponent);

export default headerModule;