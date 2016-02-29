import angular from 'angular';
import 'angular-ui-router';
import footerComponent from './footer.component';

let footerModule = angular.module('footer', [
	'ui.router'
])
.directive('footer', footerComponent);

export default footerModule;