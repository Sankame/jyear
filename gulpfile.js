// gulpを読み込む
var gulp = require('gulp');
// gulpプラグインを読み込む
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var minifyCss = require('gulp-minify-css');
var rev = require('gulp-rev');
var revReplace = require('gulp-rev-replace');
var clean = require('gulp-clean');

//ファイルパス
var basePath = './Views/Public/simple-cal';
var jsDist = '/js/dist';
var cssDist = '/css/dist';

gulp.task('clean', function () {
  return gulp.src([
          basePath + jsDist
          ,basePath + cssDist
          ,'./Views/simple-cal.stencil'
          ]
          , {read: false})
    .pipe(clean());
});

// jsタスクを定義する
gulp.task('js1', ['clean'], function () {
  // タスクを実行するグロブを指定
  return gulp.src([
  	basePath + '/js/modernizr-2.6.2.min.js'
  	,basePath + '/js/respond.min.js'
  	,basePath + '/js/jquery.min.js'
  	])
    // 実行する処理を実行する順にpipeでつないでいく
    .pipe(concat('bundle1.js')) //ファイルを結合し、bundle.jsファイルとして出力
    .pipe(uglify({preserveComments: 'some'})) // ファイルを圧縮する（ライセンス情報は外す）
    .pipe(gulp.dest(basePath + jsDist)); //distディレクトリに出力
});

// jsタスクを定義する
gulp.task('js2', ['clean'], function () {
  // タスクを実行するグロブを指定
  return gulp.src([
  	basePath + '/js/jquery.easing.1.3.js'
  	,basePath + '/js/bootstrap.min.js'
  	])
    // 実行する処理を実行する順にpipeでつないでいく
    .pipe(concat('bundle2.js')) //ファイルを結合し、bundle.jsファイルとして出力
    .pipe(uglify({preserveComments: 'some'})) // ファイルを圧縮する（ライセンス情報は外す）
    .pipe(gulp.dest(basePath + jsDist)); //distディレクトリに出力
});

// jsタスクを定義する
gulp.task('js3', ['clean'], function () {
  // タスクを実行するグロブを指定
  return gulp.src([
  	basePath + '/js/owl.carousel.min.js'
  	,basePath + '/js/jquery.stellar.min.js'
  	,basePath + '/js/jquery.waypoints.min.js'
  	,basePath + '/js/jquery.countTo.js'
  	,basePath + '/js/main.js'
  	,basePath + '/js/simple-cal.js'
  	])
    // 実行する処理を実行する順にpipeでつないでいく
    .pipe(concat('bundle3.js')) //ファイルを結合し、bundle.jsファイルとして出力
    .pipe(uglify({preserveComments: 'some'})) // ファイルを圧縮する（ライセンス情報は外す）
    .pipe(gulp.dest(basePath + jsDist)); //distディレクトリに出力
});

gulp.task('css1', ['clean'], function() {
  return gulp.src([
          basePath + '/css/animate.css'
          ,basePath + '/css/icomoon.css'
      ])
    .pipe(concat('bundle1.css'))
    .pipe(minifyCss())
    .pipe(gulp.dest(basePath + cssDist));
});

gulp.task('css2', ['clean'], function() {
  return gulp.src([
  		  basePath + '/css/bootstrap.css'
      ])
    .pipe(concat('bundle2.css'))
    .pipe(minifyCss())
    .pipe(gulp.dest(basePath + cssDist));
});

gulp.task('css3', ['clean'], function() {
  return gulp.src([
  		  basePath + '/css/owl.carousel.min.css'
          ,basePath + '/css/owl.theme.default.min.css'
          ,basePath + '/css/style.css'
      ])
    .pipe(concat('bundle3.css'))
    .pipe(minifyCss())
    .pipe(gulp.dest(basePath + cssDist));
});

gulp.task('js-rev', ['js1','js2','js3'], () => {
  return gulp.src(basePath + jsDist + '/*.js')
    .pipe(rev())
    .pipe(gulp.dest(basePath + jsDist))
    .pipe(rev.manifest())
    .pipe(gulp.dest(basePath + jsDist));
});

gulp.task('css-rev', ['css1','css2','css3'], () => {
  return gulp.src(basePath + cssDist + '/*.css')
    .pipe(rev())
    .pipe(gulp.dest(basePath + cssDist))
    .pipe(rev.manifest())
    .pipe(gulp.dest(basePath + cssDist));
});

// stencil上のcss/jsの記述をバージョン付きに変更。
gulp.task('rev-replace', ['js-rev','css-rev'], () => {
  var manifest = gulp.src([
                basePath + jsDist + '/rev-manifest.json'
                ,basePath + cssDist + '/rev-manifest.json']
                );
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

