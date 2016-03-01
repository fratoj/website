class HeaderController {
	constructor($state){
		this.name = 'header';
    this.states = $state.get().filter(state => !state.abstract && state.data.showinnav);
	}
}


export default HeaderController;