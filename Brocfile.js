var filterCoffeeScript = require('broccoli-coffee');
var pickFiles = require('broccoli-static-compiler');
var concat = require('broccoli-concat');
var compileSass = require('broccoli-sass');
var mergeTrees = require('broccoli-merge-trees');
var findBowerTrees = require('broccoli-bower');

function preprocess (tree) {
  tree = filterCoffeeScript(tree, {
    bare: true
  });
  return tree;
};

var app = 'app';
var javascript = pickFiles(app, {
  srcDir: 'javascript',
  destDir: 'appkit'
});
javascript = preprocess(javascript);

var stylesheets = pickFiles(app, {
  srcDir: 'stylesheets',
  destDir: 'appkit'
});

var sourceTrees = [javascript, stylesheets];
sourceTrees = sourceTrees.concat(findBowerTrees());

var appAndDependencies = new mergeTrees(sourceTrees, { overwrite: true });

var appJs = concat(appAndDependencies, {
  inputFiles: [
    '**/*.js'
  ],
  outputFile: '/assets/app.js'
});

var appCss = compileSass(sourceTrees, 'appkit/app.scss', 'assets/app.css');

var images = pickFiles(app, {
  srcDir: 'images',
  destDir: 'assets'
});

var publicFiles = 'app/public';

module.exports = mergeTrees([appJs, appCss, images, publicFiles]);
