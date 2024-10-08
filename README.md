# PkScript

## 概要
VBA用Luaスクリプトです. 某ゲームの解析用.

## 使い方
- LCGが呼ばれるとOutput Consoleに表示されます. `AddressList_Em.txt`に概要が記載されている消費契機は, 概要も表示されます.
- 描画消費(`$080007ba`)と戦闘中の消費(`$080386ea`)は例外で表示しないようにしてあります.

### 便利機能
- `A`キー/`D`キーでLCGを戻す/進めることができます.
- `shift`+`S`キーで乱数消費のログをファイルに出力することができます.

### 汎用関数
#### `noticeCall(address, register, radix)`
- `address`で指定したアドレスを通るとConsoleにレジスタの値を表示します. 
- `register`は文字列`"r0"`等を指定します. 対応したレジスタの値が表示されます. 指定しない場合は`r0`から`r15`まで全部表示されます.
- `radix`は表示する値の表示形式を文字列で`"%d"`のように指定します. 指定しない場合は`"%d"`になります.

#### `rewriteRegister(address, register, value, display)`
- `address`で指定したアドレス+4を通ると, `register`で指定したレジスタの値を`value`で渡した値に書き換えます.
- アドレス+4を指定するのはLCG関数が呼び出されているアドレスを指定して, `r0`に返ってきた値を書き換える使い方を想定しているためです.
- `display`は書き換えた際にConsoleに表示するかどうかをbooleanで指定します. 指定しない場合は`false`になります.

## その他
- `AddressList_Em.txt`は完全ではありません. 処理の概要しか調べていないものや, 概要すらわかっていないものもあります. 
詳細が判明した場合はぜひ`Addresslist_Em.txt`に追記し, `Research`ブランチにプルリクエストを送ってください.

#### AddressList_Em.txtの書式
- $[$0806f050が呼ばれるアドレス],[消費用途],[その他]
