import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { Blogpost } from './blogpost';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/observable/throw';

const API_URL = '/api';

@Injectable()
export class BlogpostService {

  constructor(
    private http: Http
  ) { }

  public getAllBlogposts(): Observable<Blogpost[]> {
    return this.http
      .get(API_URL + '/blogposts')
      .map(response => {
        const blogposts = response.json().data;
        return blogposts.map((blogpost) => new Blogpost(blogpost));
      }).catch(this.handleError);
  }

  public getBlogpost(id: number): Observable<Blogpost> {
    return this.http
      .get(API_URL + '/blogposts/' + id)
      .map(response => {
        const blogpost = response.json().data;
        return new Blogpost(blogpost);
      }).catch(this.handleError);
  }

  private handleError(error: Response | any) {
    console.error('ApiService::handleError', error);
    return Observable.throw(error);
  }
}
