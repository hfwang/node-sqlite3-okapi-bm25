var fs = require('fs');

module.exports = exports = function(sqlite, callback) {
  var base_path    = __dirname + '/build/Release/okapi-bm25';
  var linux_path   = base_path + '.so';
  var osx_path     = base_path + '.dylib';
  var windows_path = base_path + '.dll';

  var extension_path = null;

  if (fs.existsSync(linux_path)) {
    extension_path = linux_path;
  } else if (fs.existsSync(osx_path)) {
    extension_path = osx_path;
  } else if (fs.existsSync(windows_path)) {
    extension_path = windows_path;
  } else {
    callback(new Error("Unable to find okapi-bm25 extension."));
  }

  sqlite.loadExtension(extension_path, callback);
};
