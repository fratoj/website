import template from './careers.html!text';
import controller from './careers.controller';
import './careers.css!';

let careersComponent = function(){
	return {
		template,
		controller,
		restrict: 'E',
		controllerAs: 'vm',
		scope: {},
		bindToController: true
	};
};

export default careersComponent;
