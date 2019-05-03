require! gulp: {src, dest, parallel}
require! {
  fs
  delete: del
  'gulp-livescript': lsc
  'gulp-rename': rename
}


!function build(cb)
  src \lib/*.ls
    .pipe lsc bare:true
    .pipe dest \./
  cb!

!function clean(cb)
  del [\*.js \*.log \*.tgz] cb

exports.build = build
exports.clean = clean
exports.default = build
