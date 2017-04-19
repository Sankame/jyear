// gulpとgulpプラグインを読み込む。
var gulp = require('gulp');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var minifyCss = require('gulp-minify-css');
var rev = require('gulp-rev');
var revReplace = require('gulp-rev-replace');
var clean = require('gulp-clean');

// ファイルパス
var basePath = './Views/Public/simple-cal';
var jsDist = '/js/dist';
var cssDist = '/css/dist';

// 出力対象のディレクトリやファイルを事前に削除。
gulp.task('clean', function () {
  return gulp.src([
          basePath + jsDist
          ,basePath + cssDist
          ,'./Views/simple-cal.stencil'
          ]
          , {read: false})
    .pipe(clean());
});

// jsの結合、圧縮タスクを定義。
gulp.task('js1', ['clean'], function () {
  return gulp.src([
  	basePath + '/js/modernizr-2.6.2.min.js'
  	,basePath + '/js/respond.min.js'
  	,basePath + '/js/jquery.min.js'
  	])
    // 実行順にpipeでつなぐ。
    // ファイルを結合し、bundleファイルとして出力。
    .pipe(concat('bundle1.js'))
    // ファイルを圧縮する。
    .pipe(uglify({preserveComments: 'some'}))
    // 最後にdistディレクトリへ出力。
    .pipe(gulp.dest(basePath + jsDist));
});

gulp.task('js2', ['clean'], function () {
  return gulp.src([
  	basePath + '/js/jquery.easing.1.3.js'
  	,basePath + '/js/bootstrap.min.js'
  	])
    .pipe(concat('bundle2.js'))
    .pipe(uglify({preserveComments: 'some'}))
    .pipe(gulp.dest(basePath + jsDist));
});

gulp.task('js3', ['clean'], function () {
  return gulp.src([
  	basePath + '/js/owl.carousel.min.js'
  	,basePath + '/js/jquery.stellar.min.js'
  	,basePath + '/js/jquery.waypoints.min.js'
  	,basePath + '/js/jquery.countTo.js'
  	,basePath + '/js/main.js'
  	])
    .pipe(concat('bundle3.js'))
    .pipe(uglify({preserveComments: 'some'}))
    .pipe(gulp.dest(basePath + jsDist));
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

// js/cssファイル名をユニーク化。
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

// オリジナルstencilファイル内のjs/cssファイル名をユニーク化後
// のファイル名に置換し、Views以下に配置。
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

// 上記タスクをdefaultとして登録
gulp.task('default', ['js1','js2','js3'
                      ,'css1','css2','css3'
                      ,'js-rev','css-rev','rev-replace']
);

