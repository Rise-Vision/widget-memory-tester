/* jshint node: true */

(function (console) {
  "use strict";

  var gulp = require("gulp");
  var exec = require('child_process').exec;


  gulp.task('test', function (cb) {
    exec('node run-player.js', function (err, stdout, stderr) {
      console.log(stdout);
      console.log(stderr);
      cb(err);
    });
  });


})(console);
