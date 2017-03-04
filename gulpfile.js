var gulp = require('gulp');
// gulpプラグイン
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var minifyCss = require('gulp-minify-css');

// タスクを定義
gulp.task('js1', function () {
  gulp.src([
    './path-to/js/modernizr-2.6.2.min.js'
    ,'./path-to/js/respond.min.js'
    ,'./path-to/js/jquery.min.js'
    ])
    // 実行順にpipeでつなぐ
    // ファイルを結合し、bundle.jsファイルとして出力
    .pipe(concat('bundle1.js'))
    // ファイルを圧縮する
    .pipe(uglify({preserveComments: 'some'}))
    // 最後にdistディレクトリへ出力
    .pipe(gulp.dest('./path-to/js/dist'));
});

gulp.task('js2', function () {
  gulp.src([
    './path-to/js/jquery.easing.1.3.js'
    ,'./path-to/js/bootstrap.min.js'
    ])
    .pipe(concat('bundle2.js'))
    .pipe(uglify({preserveComments: 'some'}))
    .pipe(gulp.dest('./path-to/js/dist'));
});

gulp.task('js3', function () {
  gulp.src([
    './path-to/js/owl.carousel.min.js'
    ,'./path-to/js/jquery.stellar.min.js'
    ,'./path-to/js/jquery.waypoints.min.js'
    ,'./path-to/js/jquery.countTo.js'
    ,'./path-to/js/main.js'
    ])
    .pipe(concat('bundle3.js'))
    .pipe(uglify({preserveComments: 'some'}))
    .pipe(gulp.dest('./path-to/js/dist'));
});

gulp.task('css1', function() {
  return gulp.src([
          './path-to/css/animate.css'
          ,'./path-to/css/icomoon.css'
      ])
    .pipe(concat('bundle1.css'))
    .pipe(minifyCss())
    .pipe(gulp.dest('./path-to/css/dist'));
});

gulp.task('css2', function() {
  return gulp.src([
        './path-to/css/bootstrap.css'
      ])
    .pipe(concat('bundle2.css'))
    .pipe(minifyCss())
    .pipe(gulp.dest('./path-to/css/dist'));
});

gulp.task('css3', function() {
  return gulp.src([
        './path-to/css/owl.carousel.min.css'
          ,'./path-to/css/owl.theme.default.min.css'
          ,'./path-to/css/style.css'
      ])
    .pipe(concat('bundle3.css'))
    .pipe(minifyCss())
    .pipe(gulp.dest('./path-to/css/dist'));
});

// 上記タスクをdefaultとして登録
gulp.task('default', ['js1','js2','js3','css1','css2','css3']);