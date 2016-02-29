import template from './header.html!text';
import controller from './header.controller';
import './header.css!';

let headerComponent = function(){
	return {
		template,
		controller,
		restrict: 'E',
		controllerAs: 'vm',
		scope: {},
		bindToController: true
	};
};

export default headerComponent;
