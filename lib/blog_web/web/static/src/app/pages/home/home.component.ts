import { Component, OnInit } from '@angular/core';
import { faRocket, faMobileAlt, faThLarge, faCheckSquare } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  faRocket = faRocket;
  faMobileAlt = faMobileAlt;
  faThLarge = faThLarge;
  faCheckSquare = faCheckSquare;

  constructor() { }

  ngOnInit() {
  }

}
