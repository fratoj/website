import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { Client } from './clients/client.model';
import { Career } from './jobs/career.model';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/observable/throw';

const API_URL = '/api';

@Injectable()
export class ApiService {

  constructor(
    private http: Http
  ) { }

  public getAllClients(): Observable<Client[]> {
    return this.http
      .get(API_URL + '/clients')
      .map(response => {
        const clients = response.json().data;
        return clients.map((client) => new Client(client));
      }).catch(this.handleError);
  }

  public getAlljobs(): Observable<Career[]> {
    return this.http
      .get(API_URL + '/careers')
      .map(response => {
        const careers = response.json().data;
        return careers.map((career) => new Career(career));
      }).catch(this.handleError);
  }

  public getClientById(clientId: number): Observable<Client> {
    return this.http
      .get(API_URL + '/clients/' + clientId)
      .map(response => {
        return new Client(response.json());
      })
      .catch(this.handleError);
  }

  private handleError(error: Response | any) {
    console.error('ApiService::handleError', error);
    return Observable.throw(error);
  }
}
