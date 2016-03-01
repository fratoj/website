class ClientsController {
  constructor($firebaseArray){
  this.name = 'clients';
    var ref = new Firebase("https://fratoj.firebaseio.com/clients");
    // download the data into a local object
    this.clients = $firebaseArray(ref);
	}
}


export default ClientsController;