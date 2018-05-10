import { TestBed, inject } from '@angular/core/testing';

import { BlogpostService } from './blogpost.service';

describe('BlogpostService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [BlogpostService]
    });
  });

  it('should be created', inject([BlogpostService], (service: BlogpostService) => {
    expect(service).toBeTruthy();
  }));
});
