var lvsc, sourcemaps;
lvsc = require('gulp-livescript');
sourcemaps = require('gulp-sourcemaps');
gulp.src('./lib/*.ls').pipe(sourcemaps.init()).pipe(livescript({
  bare: true
})).on('error', gutil.log).pipe(sourcemaps.write()).pipe(gulp.dest('./js/'));
