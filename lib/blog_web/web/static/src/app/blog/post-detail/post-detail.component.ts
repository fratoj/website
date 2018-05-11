import { Component, OnInit } from '@angular/core';
import { Blogpost } from '../blogpost';
import { BlogpostService } from '../blogpost.service';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { switchMap } from 'rxjs/operators';
import { Observable } from 'rxjs/Observable';

@Component({
  selector: 'app-post-detail',
  templateUrl: './post-detail.component.html',
  styleUrls: ['./post-detail.component.scss']
})
export class PostDetailComponent implements OnInit {
  postId: number;
  blogpost: Blogpost;

  constructor(private router: Router, private route: ActivatedRoute, private blogpostService: BlogpostService) {
    route.params.subscribe(
      params => {
        this.postId = parseInt(params['id'], 10);
        this.getBlogpost();
      }
    );
  }

  ngOnInit() {
  }

  private getBlogpost() {
    this.blogpostService.getBlogpost(this.postId).subscribe((post) => {
      this.blogpost = post;
    });
  }
}
