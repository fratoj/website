import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { FooterComponent } from './footer/footer.component';
import { NavmenuComponent } from './navmenu/navmenu.component';
import { HeroComponent } from './hero/hero.component';
import { PagesModule } from './pages/pages.module';
import { ClientsComponent } from './pages/clients/clients.component';
import { HomeComponent } from './pages/home/home.component';
import { JobsComponent } from './pages/jobs/jobs.component';
import { AboutComponent } from './pages/about/about.component';
import { ContactComponent } from './pages/contact/contact.component';
import { BlogModule } from './blog/blog.module';
import { PostComponent } from './blog/post/post.component';
import { PostDetailComponent } from './blog/post-detail/post-detail.component';

const appRoutes: Routes = [
  {
    path: 'home',
    component: HomeComponent,
    data: { title: 'Home' }
  },
  {
    path: 'clients',
    component: ClientsComponent,
    data: { title: 'Clients' }
  },
  {
    path: 'jobs',
    component: JobsComponent,
    data: { title: 'Jobs' }
  },
  {
    path: 'about',
    component: AboutComponent,
    data: { title: 'About' }
  },
  {
    path: 'contact',
    component: ContactComponent,
    data: { title: 'Contact' }
  },
  {
    path: 'blog/:id',
    component: PostDetailComponent
  },
  {
    path: 'blog',
    component: PostComponent,
    data: { title: 'Blog' }
  },
  {
    path: '',
    redirectTo: '/home',
    pathMatch: 'full'
  },
  { path: '**', component: PageNotFoundComponent }];

@NgModule({
  declarations: [
    AppComponent,
    PageNotFoundComponent,
    FooterComponent,
    NavmenuComponent,
    HeroComponent,
    LoginComponent
  ],
  imports: [
    BrowserModule,
    HttpModule,
    PagesModule,
    BlogModule,
    RouterModule.forRoot(
      appRoutes,
      // { enableTracing: true } // <-- debugging purposes only
    )
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
