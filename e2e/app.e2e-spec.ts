import { FratojWebsitePage } from './app.po';

describe('fratoj-website App', () => {
  let page: FratojWebsitePage;

  beforeEach(() => {
    page = new FratojWebsitePage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
