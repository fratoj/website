import { Component, OnInit } from '@angular/core';
import { Blogpost } from '../blogpost';
import { BlogpostService } from '../blogpost.service';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { switchMap } from 'rxjs/operators';
import { Observable } from 'rxjs/Observable';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-post-detail',
  templateUrl: './post-detail.component.html',
  styleUrls: ['./post-detail.component.scss']
})
export class PostDetailComponent implements OnInit {
  postId: number;
  blogpost: Blogpost;
  blogForm: FormGroup;
  newBlog: boolean;
  editing: boolean;

  constructor(private router: Router, private route: ActivatedRoute, private fb: FormBuilder, private blogpostService: BlogpostService) {
    route.params.subscribe(
      params => {
        this.postId = parseInt(params['id'], 10);
        this.getBlogpost();
      }
    );
    this.route.data
      .subscribe((data: { new: boolean }) => {
        console.log(data.new);
        this.newBlog = data.new;
      });
  }

  ngOnInit() {
    this.createForm();
  }

  public save() {
    const formModel = this.blogForm.value;
    const saveBlog: Blogpost = {
      id: this.blogpost.id,
      title: formModel.title as string,
      description: formModel.description as string,
      text: formModel.text as string,
      slug: formModel.slug as string,
      published: formModel.published as boolean,
      user_id: formModel.user_id as number
    };
    console.log(saveBlog);
    this.blogpostService.saveBlogpost(saveBlog);
  }

  private createForm() {
    this.blogForm = this.fb.group({
      title: ['', Validators.required],
      description: '',
      text: '',
      slug: '',
      published: 'draft',
      user_id: 1
    });
  }

  private updateForm() {
    this.blogForm.setValue({
      title: this.blogpost.title,
      description: this.blogpost.description,
      text: this.blogpost.text,
      slug: this.blogpost.slug,
      published: this.blogpost.published,
      user_id: this.blogpost.user_id
    });
  }

  private getBlogpost() {
    if (!this.newBlog && this.postId) {
      this.blogpostService.getBlogpost(this.postId).subscribe((post) => {
        this.blogpost = post;
        this.updateForm();
      });
    } else {
      this.editing = true;
    }
  }
}
