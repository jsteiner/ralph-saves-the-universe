var filterCoffeeScript = require('broccoli-coffee');
var pickFiles = require('broccoli-static-compiler');
var compileES6 = require('broccoli-es6-concatenator');
var compileSass = require('broccoli-sass');
var mergeTrees = require('broccoli-merge-trees');
var findBowerTrees = require('broccoli-bower');

function preprocess (tree) {
  tree = filterCoffeeScript(tree, {
    bare: true
  });

  return tree;
}

var javascript = 'javascript';
javascript = pickFiles(javascript, {
  srcDir: '',
  destDir: 'appkit'
})
javascript = preprocess(javascript);

var stylesheets = 'stylesheets'
stylesheets = pickFiles(stylesheets, {
  srcDir: '',
  destDir: 'appkit'
});
stylesheets = preprocess(stylesheets);

var vendor = 'vendor';

var sourceTrees = [javascript, stylesheets, vendor]
sourceTrees = sourceTrees.concat(findBowerTrees());

var appAndDependencies = new mergeTrees(sourceTrees, { overwrite: true });

var appJs = compileES6(appAndDependencies, {
  loaderFile: 'loader.js',
  inputFiles: [
    'appkit/**/*.js'
  ],
  legacyFilesToAppend: [
    'phaser.js'
  ],
  outputFile: '/assets/app.js'
});

var appCss = compileSass(sourceTrees, 'appkit/app.scss', 'assets/app.css');

var publicFiles = 'public';

module.exports = mergeTrees([appJs, appCss, publicFiles]);
