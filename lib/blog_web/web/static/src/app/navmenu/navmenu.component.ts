import { strictEqual } from 'assert';
import { Component, DoCheck } from '@angular/core';

@Component({
  selector: 'app-navmenu',
  templateUrl: './navmenu.component.html',
  styleUrls: ['./navmenu.component.scss']
})
export class NavmenuComponent implements DoCheck {
  public isHome: boolean;

  constructor() {
  }

  ngDoCheck() {
    // TODO: Issue #20 - fix this with the angular router
    this.isHome = window.location.pathname === '/home';
  }
}
