
gulp = require 'gulp'
plumber = require 'gulp-plumber'
coffee = require 'gulp-coffee'
del = require 'del'

gulp.task 'default', ['coffee'], ->

gulp.task 'watch', ['default'], ->
  gulp.watch './src/*.coffee', ['coffee']

gulp.task 'clean', ->
  del ['./lib/*.js', '**/*.log']
                  
gulp.task 'coffee', ->
  gulp.src './src/*.coffee'
  .pipe plumber()
  .pipe coffee()
  .pipe gulp.dest './lib'
