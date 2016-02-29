import template from './clients.html!text';
import controller from './clients.controller';
import './clients.css!';

let clientsComponent = function(){
	return {
		template,
		controller,
		restrict: 'E',
		controllerAs: 'vm',
		scope: {},
		bindToController: true
	};
};

export default clientsComponent;
