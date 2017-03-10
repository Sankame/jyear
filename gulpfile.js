// gulpを読み込む
var gulp = require('gulp');
// gulpプラグインを読み込む
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var minifyCss = require('gulp-minify-css');
var rev = require('gulp-rev');
var revReplace = require('gulp-rev-replace');
var clean = require('gulp-clean');

gulp.task('clean', function () {
  return gulp.src([
          './Views/Public/simple-cal/js/dist'
          ,'./Views/Public/simple-cal/css/dist'
          ,'./Views/simple-cal.stencil'
          ]
          , {read: false})
    .pipe(clean());
});

// jsタスクを定義する
gulp.task('js1', ['clean'], function () {
  // タスクを実行するグロブを指定
  return gulp.src([
  	'./Views/Public/simple-cal/js/modernizr-2.6.2.min.js'
  	,'./Views/Public/simple-cal/js/respond.min.js'
  	,'./Views/Public/simple-cal/js/jquery.min.js'
  	])
    // 実行する処理を実行する順にpipeでつないでいく
    .pipe(concat('bundle1.js')) //ファイルを結合し、bundle.jsファイルとして出力
    .pipe(uglify({preserveComments: 'some'})) // ファイルを圧縮する（ライセンス情報は外す）
    .pipe(gulp.dest('./Views/Public/simple-cal/js/dist')); //distディレクトリに出力
});

// jsタスクを定義する
gulp.task('js2', ['clean'], function () {
  // タスクを実行するグロブを指定
  return gulp.src([
  	'./Views/Public/simple-cal/js/jquery.easing.1.3.js'
  	,'./Views/Public/simple-cal/js/bootstrap.min.js'
  	])
    // 実行する処理を実行する順にpipeでつないでいく
    .pipe(concat('bundle2.js')) //ファイルを結合し、bundle.jsファイルとして出力
    .pipe(uglify({preserveComments: 'some'})) // ファイルを圧縮する（ライセンス情報は外す）
    .pipe(gulp.dest('./Views/Public/simple-cal/js/dist')); //distディレクトリに出力
});

// jsタスクを定義する
gulp.task('js3', ['clean'], function () {
  // タスクを実行するグロブを指定
  return gulp.src([
  	'./Views/Public/simple-cal/js/owl.carousel.min.js'
  	,'./Views/Public/simple-cal/js/jquery.stellar.min.js'
  	,'./Views/Public/simple-cal/js/jquery.waypoints.min.js'
  	,'./Views/Public/simple-cal/js/jquery.countTo.js'
  	,'./Views/Public/simple-cal/js/main.js'
  	,'./Views/Public/simple-cal/js/simple-cal.js'
  	])
    // 実行する処理を実行する順にpipeでつないでいく
    .pipe(concat('bundle3.js')) //ファイルを結合し、bundle.jsファイルとして出力
    .pipe(uglify({preserveComments: 'some'})) // ファイルを圧縮する（ライセンス情報は外す）
    .pipe(gulp.dest('./Views/Public/simple-cal/js/dist')); //distディレクトリに出力
});

gulp.task('css1', ['clean'], function() {
  return gulp.src([
          './Views/Public/simple-cal/css/animate.css'
          ,'./Views/Public/simple-cal/css/icomoon.css'
      ])
    .pipe(concat('bundle1.css'))
    .pipe(minifyCss())
    .pipe(gulp.dest('./Views/Public/simple-cal/css/dist'));
});

gulp.task('css2', ['clean'], function() {
  return gulp.src([
  		  './Views/Public/simple-cal/css/bootstrap.css'
      ])
    .pipe(concat('bundle2.css'))
    .pipe(minifyCss())
    .pipe(gulp.dest('./Views/Public/simple-cal/css/dist'));
});

gulp.task('css3', ['clean'], function() {
  return gulp.src([
  		  './Views/Public/simple-cal/css/owl.carousel.min.css'
          ,'./Views/Public/simple-cal/css/owl.theme.default.min.css'
          ,'./Views/Public/simple-cal/css/style.css'
      ])
    .pipe(concat('bundle3.css'))
    .pipe(minifyCss())
    .pipe(gulp.dest('./Views/Public/simple-cal/css/dist'));
});

gulp.task('js-rev', ['js1','js2','js3'], () => {
  return gulp.src('./Views/Public/simple-cal/js/dist/*.js')
    .pipe(rev())
    .pipe(gulp.dest('./Views/Public/simple-cal/js/dist'))
    .pipe(rev.manifest())
    .pipe(gulp.dest('./Views/Public/simple-cal/js/dist'));
});

gulp.task('css-rev', ['css1','css2','css3'], () => {
  return gulp.src('./Views/Public/simple-cal/css/dist/*.css')
    .pipe(rev())
    .pipe(gulp.dest('./Views/Public/simple-cal/css/dist'))
    .pipe(rev.manifest())
    .pipe(gulp.dest('./Views/Public/simple-cal/css/dist'));
});

// html上のcss/jsの記述をバージョン付きに変更。
gulp.task('rev-replace', ['js-rev','css-rev'], () => {
  var manifest = gulp.src([
                './Views/Public/simple-cal/js/dist/rev-manifest.json'
                ,'./Views/Public/simple-cal/css/dist/rev-manifest.json']
                );
  // return gulp.src('./Views/*.+(html|stencil)')
    return gulp.src('./Views/stencil.org/simple-cal.stencil')
    .pipe(revReplace({manifest: manifest
                      ,replaceInExtensions:['.stencil']
                    }))
    .pipe(gulp.dest('./Views'));
});

// jsタスクをdefaultタスクとして登録
gulp.task('default', ['js1','js2','js3'
                      ,'css1','css2','css3'
                      ,'js-rev','css-rev','rev-replace']
);

