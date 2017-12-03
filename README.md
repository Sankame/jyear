# 概要

Server Side Swiftで元号とカレンダーを表示します。

# 動作環境

* [Swift] 3.0.1
* [Kitura] 1.1
* [gulp] 3.9.1

# ビルド

- ソースコードのルートディレクトリで下記コマンドを実行。

    $ swift build && ./.build/debug/jyear

- ビルドが通れば下記が表示されます。(前回ビルドから修正がない場合は何も出ません)

    $ Linking ./.build/debug/jyear

- 下記ファイルを修正した場合は、同ディレクトリでgulpを実行後にswift buildして下さい。

    - 対象ファイル

        * js
        * css
        * [ソースコードのルート]/Views/stencil.org/simple-cal.stencil

    - 実行コマンド

        $ gulp

# 表示確認

- 元号

    - http://localhost:8090

- カレンダー

    - http://localhost:8090/cal

# 作成者

**Copyright © Sankame**

# ライセンス

本ソースコードはMITライセンスの元に公開しています。
