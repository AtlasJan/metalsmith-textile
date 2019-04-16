#TODO: Finish logic for the code
module.exports = (grunt) ->
  grunt.initConfig {
    pkg: grunt.file.readJSON('package.json')
    build:
      src: 'lib/index.ls'
      dest:'build/index.js'
  }
  grunt.loadNpmTasks 'grunt-livescript'
