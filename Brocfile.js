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

var javascript = 'javascript';
javascript = pickFiles(javascript, {
  srcDir: '',
  destDir: 'appkit'
});
javascript = preprocess(javascript);

var stylesheets = 'stylesheets'
stylesheets = pickFiles(stylesheets, {
  srcDir: '',
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

var images = 'images'
images = pickFiles(images, {
  srcDir: '',
  destDir: 'assets'
});

var publicFiles = 'public';

module.exports = mergeTrees([appJs, appCss, images, publicFiles]);
