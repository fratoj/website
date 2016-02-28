class NavbarController {
	constructor($state){
		this.name = 'homepage';
    this.states = $state.get().filter(state => !state.abstract);

    // console.log(angular.toJson(this.states));
	}

}

export default NavbarController;