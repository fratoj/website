export class Client {
  public name: string;
  public bio: string;
  public active: boolean;

  public constructor(aClient) {
    this.name = aClient.name;
    this.bio = aClient.bio;
    this.active = aClient.active;
  }
}
