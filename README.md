Betascape-2012
==============

### Requirements

The site is all static, but has some node.js based tools for managing css and js compilation.

You'll need recess:

    npm install recess -g

and coffeescript:

    npm install coffee-script -g

and uglify.js:

    npm install uglify-js -g

### Hacking

Make changes to css-src/style.less and js-src/application.coffee, run `make`.

Run `make web` for a simple webserver. Site will be available at http://localhost:8000

### Building

Run the default make task:

    make

Done. Check in all the compiled resources and deploy.
