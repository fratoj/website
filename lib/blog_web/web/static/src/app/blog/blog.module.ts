import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { PostComponent } from './post/post.component';
import { BlogpostService } from './blogpost.service';
import { PostDetailComponent } from '../blog/post-detail/post-detail.component';
import { RouterModule } from '@angular/router';

@NgModule({
  imports: [
    CommonModule, RouterModule, ReactiveFormsModule
  ],
  providers: [BlogpostService],
  declarations: [PostComponent, PostDetailComponent]
})
export class BlogModule { }
