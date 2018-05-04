import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
// import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  user_id: number;

  // constructor(private result: Http, private router: Router) { }
  constructor(private result: Http) { }

  ngOnInit() {
    this.getUser();
  }

  public login() {
    // this.router.navigate(['/auth/google?scope=email profile']);
    window.location.href = '/auth/google?scope=email profile';
  }

  public logout() {
    // this.router.navigate(['/auth/signout']);
    window.location.href = '/auth/signout';
  }

  public getUser() {
    return this.result.get('/api/userdata').subscribe(
      data => {
        const result = data.json();
        this.user_id = result.user;
        console.log(data.json());
      },
      error => console.log(error),
      () => console.log('Fine !')
    );
  }
}
