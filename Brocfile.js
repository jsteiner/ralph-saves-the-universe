var filterCoffeeScript = require('broccoli-coffee');
var pickFiles = require('broccoli-static-compiler');
var mergeTrees = require('broccoli-merge-trees');

function preprocess (tree) {
  tree = filterCoffeeScript(tree, {
    bare: true
  });

  return tree;
}

var javascript = 'javascript';
javascript = pickFiles(javascript, {
  srcDir: '',
  destDir: 'assets'
})
javascript = preprocess(javascript);

var publicFiles = 'public'

module.exports = mergeTrees([javascript, publicFiles]);
