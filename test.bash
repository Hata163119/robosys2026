#!/bin/bash
# SPDX-FileCopyrightText: 2026 Kouta Hayakawa
# SPDX-License-Identifier: BSD-3-Clause

ng () {                               # 関数ngの定義（P18と同じ）
        echo ${1}行目のテスト失敗
        res=1                          # 失敗したことを記録
}

res=0                                  # 0: 失敗なし（ngが呼ばれると1になる）

### NORMAL INPUT ###
out=$(seq 5 | ./plus)                  # plusの出力を変数outに記録
[ "$?" = 0 ]      || ng "$LINENO"      # 終了ステータスが0か確認
[ "${out}" = 15 ] || ng "$LINENO"     # 期待する出力（15）か確認

### STRANGE INPUT ###
out=$(echo あ | ./plus)                # 計算できない値を入力
[ "$?" = 1 ]      || ng "$LINENO"      # 終了ステータスが1か確認
[ "${out}" = "" ] || ng "$LINENO"     # 出力が空か確認

out=$(echo | ./plus)                   # 何も入力しない
[ "$?" = 1 ]      || ng "$LINENO"      # 異常終了するか確認
[ "${out}" = "" ] || ng "$LINENO"     # 出力が空か確認

[ "${res}" = 0 ] && echo OK            # テスト成功ならOKを表示
exit $res                              # 終了ステータスを返して終了
