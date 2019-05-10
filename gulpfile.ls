require! gulp: {src, dest, parallel}
require! {
  fs
  delete: del
  'gulp-livescript': lsc
}


!function build(cb)
  src [\lib/*.ls \*.ls]
    .pipe lsc bare:true
    .pipe dest \./
  cb!

!function clean(cb)
  del [\*.js \*.log \*.tgz \*.html] cb

export build, clean
out$.default = build
