import template from './footer.html!text';
import controller from './footer.controller';
import './footer.css!';

let footerComponent = function(){
	return {
		template,
		controller,
		restrict: 'E',
		controllerAs: 'vm',
		scope: {},
		bindToController: true
	};
};

export default footerComponent;
