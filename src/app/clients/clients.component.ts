import { Component, OnInit } from '@angular/core';
import { AngularFire, FirebaseObjectObservable } from 'angularfire2';

// Firebase("https://fratoj.firebaseio.com/clients");

@Component({
  selector: 'app-clients',
  templateUrl: './clients.component.html',
  styleUrls: ['./clients.component.css']
})
export class ClientsComponent implements OnInit {
  public item: FirebaseObjectObservable<any>;

  constructor(af: AngularFire) {
    this.item = af.database.object('/clients');
  }

  ngOnInit() {
  }

  public test() {
    this.item.forEach((client) => {
      console.log(client);
    });
  }

}
