Fratoj website
---
See [Fratoj - The Brotherhood of code](http://fratoj.tuvok.nl)

# Getting Started
## Dependencies
What you need to run this app:
* `node` and `npm`
Once you have those, you should install these globals with `npm i -g`:
* `jspm`
* `gulp`
* `karma`
* `karma-cli`

## Installing
* `fork` me
* `clone` your fork
* `git checkout jspm`
* `npm i` to install all dependencies
* (with JSPM there's usually a `jspm install` step too, but that is added to npm's `postinstall` for convenience)

#### Failing `npm install`
If this is your first time running JSPM, you'll probably run into a `warn Error - GitHub rate limit reached`

Fix this by adding your GitHub credentials to JSPM with: `jspm registry config github`.

## Running the app
NG6 uses Gulp to build and start the dev environment. After you have installed all dependencies you can now run the app.
Run `gulp` to start a dev server and watch all files. The port will displayed to you.

### Gulp tasks
Without Webpack's required build step, serving is easy and you choose when you are ready to build now

Here's a list of possible Gulp task to run:
* `serve` (also default `gulp`)
  * starts a dev server with `browser-sync` serving the client folder and listens for changes
* `build`
  * bundles our app into a single file with all included dependencies into `dist/`. both minified and unminified included
* `component`
  * builds out boilerplate for a new angular component, [read below](#generating-components) to see how to use this in more detail

### Testing
To run test, just run `npm test` or `karma start`.

The only difference from a regular `Karma` setup is the use of [`karma-jspm`](https://github.com/Workiva/karma-jspm) plugin to let JSPM handle spec files as modules. `Karma` will run all files that match `.spec.js` inside the `app` folder. This is awesome because we can write tests for our components in the same folder with the rest of the component. Be sure to include your `spec` files in the appropriate component directory. You must name the spec file like so, `[name].spec.js`. If you don't want to use the `.spec.js` extension, you must change the `jspm.loadFiles` glob in `karma.conf.js` to look for whatever file(s) you want.

`Mocha` is the testing suite being used and `chai` is the assertion library. If you would like to change this, do so in `karma.conf.js`.


## Generating components
Following a good practice allows us to guarantee certain things. We can take advantage of these guarantees and use a task to automate things. Because the components we make will almost always have the same structure, we can generate this boilerplate for you. Boilerplate includes:
* Component folder
* Component entry file which will `import` all of its dependencies
* Component component file, or directive file will will also `import` its dependencies
* Component template
* Component controller
* Component css
* Component spec with passing tests already written

You can create all this by hand, but it gets old fast!
To generate a component, we must use the `gulp component --name componentName` task.

The `--name` flag is the name of the component you want to create. Be sure to be unique, or it will override an existing component.


The component will be created by default on the root of `client/app/components`.

We can change this by passing in the `--parent` flag.

You can pass in a path relative to `client/app/components/` and your component will be made there.

So running `gulp component --name signup --parent auth` will create a `signup` component at `client/app/components/auth/signup`.

Running `gulp component --name footer --parent ../common` will create a `footer` component at `client/app/common/footer`.

Because `--name` is used to create folder name too, use camel or snakeCase and stay consistent.

# Credits
> Starter repo for [Angular](https://angularjs.org) + [ES6](https://git.io/es6features) + [JSPM](http://jspm.io/) (or [Webpack](https://github.com/angularclass/NG6-starter/tree/master))
