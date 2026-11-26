# plusコマンド

![test](https://github.com/Hata163119/robosys2026/actions/workflows/test.yml/badge.svg)

標準入力から読み込んだ整数を足し合わせ、合計を標準出力に表示するコマンドです。

## 使用方法

```bash
seq 5 | ./plus
```

実行結果

```text
15
```

## 入力について

- 標準入力から整数を1行ずつ読み込みます。
- 入力された整数の合計を表示します。
- 不正な入力や入力がない場合はエラー終了します。

## 必要なソフトウェア

- Python 3
- テスト済みバージョン：3.10〜3.14

## テスト環境

- Ubuntu 24.04 LTS
- GitHub Actions

## テスト方法

```bash
bash test.bash
```

## ライセンス

- このソフトウェアパッケージは、3条項BSDライセンスの下で再頒布および使用が許可されます。
- © 2026 Kouta Hayakawa
