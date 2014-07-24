var filterCoffeeScript = require('broccoli-coffee');
var pickFiles = require('broccoli-static-compiler');
var compileES6 = require('broccoli-es6-concatenator');
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

var vendor = 'vendor';

var sourceTrees = [javascript, vendor].concat(findBowerTrees());
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
})

var publicFiles = 'public';

module.exports = mergeTrees([appJs, publicFiles]);
