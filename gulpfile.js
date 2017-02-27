// gulpを読み込む
var gulp = require('gulp');
// gulpプラグインを読み込む
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');

// jsタスクを定義する
gulp.task('js', function () {
  // タスクを実行するグロブを指定
  gulp.src([
  	'./Views/Public/simple-cal/js/modernizr-2.6.2.min.js'
  	,'./Views/Public/simple-cal/js/respond.min.js'
  	,'./Views/Public/simple-cal/js/jquery.min.js'
  	,'./Views/Public/simple-cal/js/jquery.easing.1.3.js'
  	,'./Views/Public/simple-cal/js/bootstrap.min.js'
  	,'./Views/Public/simple-cal/js/owl.carousel.min.js'
  	,'./Views/Public/simple-cal/js/jquery.stellar.min.js'
  	,'./Views/Public/simple-cal/js/jquery.waypoints.min.js'
  	,'./Views/Public/simple-cal/js/jquery.countTo.js'
  	,'./Views/Public/simple-cal/js/main.js'
  	,'./Views/Public/simple-cal/js/simple-cal.js'
  	])
    // 実行する処理を実行する順にpipeでつないでいく
    .pipe(concat('bundle.js')) //ファイルを結合し、bundle.jsファイルとして出力
    .pipe(uglify({preserveComments: 'some'})) // ファイルを圧縮する（ライセンス情報は外す）
    .pipe(gulp.dest('./Views/Public/simple-cal/js/dist')); //distディレクトリに出力
});

// jsタスクをdefaultタスクとして登録
gulp.task('default', ['js']);