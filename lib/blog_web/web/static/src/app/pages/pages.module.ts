import { ReactiveFormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeComponent } from './home/home.component';
import { ClientsComponent } from './clients/clients.component';
import { RouterModule } from '@angular/router';
import { JobsComponent } from './jobs/jobs.component';
import { AboutComponent } from './about/about.component';
import { ContactComponent } from './contact/contact.component';
import { FeedbackService } from './contact/feedback.service';
import { ApiService } from './api.service';
import { Http, HttpModule } from '@angular/http';

@NgModule({
  imports: [
    HttpModule,
    CommonModule,
    RouterModule,
    ReactiveFormsModule
  ],
  providers: [FeedbackService, ApiService],
  declarations: [HomeComponent, ClientsComponent, JobsComponent, AboutComponent, ContactComponent]
})
export class PagesModule { }
