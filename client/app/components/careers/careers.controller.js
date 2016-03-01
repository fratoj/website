class CareersController {
  constructor($firebaseArray){
    this.name = 'careers';
    var ref = new Firebase("https://fratoj.firebaseio.com/jobs");
    // download the data into a local object
    this.jobs = $firebaseArray(ref);
  }
}


export default CareersController;