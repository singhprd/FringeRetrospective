// var read = require('readability-js');

// // var loc = document.location;
// var loc = "http://broadwaybaby.com/shows/red-bastard-lie-with-me/719991";
// var uri = {
//   spec: loc.href,
//   host: loc.host,
//   prePath: loc.protocol + "//" + loc.host,
//   scheme: loc.protocol.substr(0, loc.protocol.indexOf(":")),
//   pathBase: loc.protocol + "//" + loc.host + loc.pathname.substr(0, loc.pathname.lastIndexOf("/") + 1)
// };
// var article = new Readability(uri, document).parse();

var read = require('readability-js');
 
read('http://howtonode.org/really-simple-file-uploads', function(err, article, meta) {
  // Main Article
  console.log(article.content.text());
 
  // Title
  console.log(article.title);
 
  // Article HTML Source Code
  console.log(article.content.html());
});