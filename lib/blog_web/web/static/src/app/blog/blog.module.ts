import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PostComponent } from './post/post.component';
import { BlogpostService } from './blogpost.service';

@NgModule({
  imports: [
    CommonModule
  ],
  providers: [BlogpostService],
  declarations: [PostComponent]
})
export class BlogModule { }
