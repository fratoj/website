import { Component, OnInit } from '@angular/core';
import { BlogpostService } from '../blogpost.service';
import { Blogpost } from '../blogpost';

@Component({
  selector: 'app-post',
  templateUrl: './post.component.html',
  styleUrls: ['./post.component.scss']
})
export class PostComponent implements OnInit {
  blogposts: Blogpost[] = [];

  constructor(private blogpostService: BlogpostService) { }

  ngOnInit() {
    this.blogpostService.getAllBlogposts().subscribe((posts) => {
      this.blogposts = posts;
    });
  }

}
