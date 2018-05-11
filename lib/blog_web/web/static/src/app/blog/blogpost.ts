export class Blogpost {
  public id: number;
  public user_id: number;
  public description: string;
  public title: string;
  public text: string;
  public slug: string;
  public published: boolean;

  public constructor(aBlogpost) {
    this.id = aBlogpost.id;
    this.user_id = aBlogpost.user_id;
    this.description = aBlogpost.description;
    this.title = aBlogpost.title;
    this.text = aBlogpost.text;
    this.slug = aBlogpost.slug;
    this.published = aBlogpost.published;
  }
}
