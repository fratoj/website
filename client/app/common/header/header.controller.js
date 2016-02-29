class HeaderController {
	constructor($state){
		this.name = 'header';
    this.states = $state.get().filter(state => !state.abstract);
	}
}


export default HeaderController;