import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { Client } from './client.model';

@Component({
  selector: 'app-clients',
  templateUrl: './clients.component.html',
  styleUrls: ['./clients.component.scss']
})
export class ClientsComponent implements OnInit {
  clients: Client[] = [];

  constructor(private apiService: ApiService) { }
  ngOnInit() {
    this.apiService.getAllClients().subscribe((clients) => {
      this.clients = clients;
    });
  }
}
