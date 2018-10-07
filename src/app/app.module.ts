import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { AngularFireModule } from 'angularfire2';

import { AppComponent } from './app.component';
import { ClientsComponent } from './clients/clients.component';

// Must export the config
export const firebaseConfig = {
  apiKey: "AIzaSyDJlKt_SYhcZF4GBXdjZlrPgjdhiWYcBWc",
  authDomain: "fratoj.firebaseapp.com",
  databaseURL: "https://fratoj.firebaseio.com",
  projectId: "firebase-fratoj",
  storageBucket: "firebase-fratoj.appspot.com",
  messagingSenderId: "274034810172"
};

@NgModule({
  declarations: [
    AppComponent,
    ClientsComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AngularFireModule.initializeApp(firebaseConfig),
    HttpModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
