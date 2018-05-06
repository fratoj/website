export class Career {
  public title: string;
  public text: string;
  public active: boolean;

  public constructor(aCareer) {
    this.title = aCareer.title;
    this.text = aCareer.text;
    this.active = aCareer.active;
  }
}
