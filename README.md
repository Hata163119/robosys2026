# shoppinglistコマンド

![test](https://github.com/Hata163119/robosys2026/actions/workflows/test.yml/badge.svg)

標準入力から買い物リストを読み込み、重複する商品を取り除いて、商品名をアルファベット順に表示するコマンドです。オプションを指定すると、商品の個数も表示できます。

## インストール方法

以下のコマンドでリポジトリを取得します。

```bash
$ git clone https://github.com/Hata163119/robosys2026.git
$ cd robosys2026
```

Python 3がインストールされていれば、追加のライブラリなしで使用できます。

## 使用方法

### 通常の使い方

```bash
$ printf "apple\nmilk\napple\nbread\nmilk\n" | ./shoppinglist
```

実行結果：

```text
apple
bread
milk
```

### 商品の個数を表示する

`-c` または `--count` オプションを指定します。

```bash
$ printf "apple\nmilk\napple\nbread\nmilk\napple\n" | ./shoppinglist -c
```

実行結果：

```text
apple 3
bread 1
milk 2
```

## 主な機能

- 標準入力から商品名を1行ずつ読み込む
- 重複する商品を取り除く
- 商品名をアルファベット順に並べる
- 大文字と小文字を区別せずに重複を判定する
- 空行を無視する
- `-c` または `--count` で商品の個数を表示する
- 入力が空の場合は何も表示しない

## 必要なソフトウェア

- Python 3
- テスト済みバージョン：3.10〜3.14

## テスト環境

- Ubuntu
- GitHub Actions

## テスト方法

```bash
$ bash test.bash
```

## ライセンス

このソフトウェアはBSD 3-Clause Licenseの下で公開しています。

Copyright (c) 2026 Kouta Hayakawa
