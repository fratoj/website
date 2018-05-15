Fratoj website
---
See [Fratoj - The Brotherhood of code](http://fratoj.tuvok.nl)

# Getting Started
To start your server:

  * Install Phoenix dependencies with `mix deps.get`
  * Install Angular dependencies with `yarn`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * get our local environment variables to work: type `source .env`<sup>1</sup><br>
    (you will need to do this for each terminal window you are using)
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Thank you
 * David Tengeri ([dtengeri](https://github.com/dtengeri)): [Using Angular 4 with Phoenix Framework 1.3](http://blog.dtengeri.com/2017/10/phoenix-angular.html)
 * Brian Emory: [Elixir Phoenix: Creating An App With Tests ](https://medium.brianemory.com/elixir-phoenix-creating-an-app-part-5-setting-a-current-user-43b90c7468d5)
 * Andrew Forward: [Continuous Testing with Elixir](https://medium.com/@a4word/continuous-testing-with-elixir-ddc1107c5cc0)
 * Joe Sweeney ([jswny](https://github.com/jswny)) [A guide to building and running zero-dependency Phoenix (Elixir) deployments with Docker.](https://gist.github.com/jswny/83e03537830b0d997924e8f1965d88bc)
 
### Footnotes
1. Read the section on [creating Google credentials in the developer console](https://medium.brianemory.com/elixir-phoenix-creating-an-app-part-4-using-google-%C3%BCberauth-e7d2ed1a3541) in the tutorial series by Brian Emory, and create the `.env` file as described.
