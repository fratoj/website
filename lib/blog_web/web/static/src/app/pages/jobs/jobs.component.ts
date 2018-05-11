import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { Career } from './career.model';

@Component({
  selector: 'app-jobs',
  templateUrl: './jobs.component.html',
  styleUrls: ['./jobs.component.scss']
})
export class JobsComponent implements OnInit {
  jobs: Career[] = [];

  constructor(private apiService: ApiService) { }
  ngOnInit() {
    this.apiService.getAlljobs().subscribe((careers) => {
      this.jobs = careers;
    });
  }
}
