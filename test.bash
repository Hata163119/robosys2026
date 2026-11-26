#!/bin/bash
# SPDX-FileCopyrightText: 2026 Kouta Hayakawa
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目のテスト失敗" >&2
    res=1
}

res=0

### NORMAL INPUT ###
out=$(printf "apple\nmilk\napple\nbread\nmilk\negg\n" | ./shoppinglist)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "$(printf "apple\nbread\negg\nmilk")" ] || ng "$LINENO"

### CASE INSENSITIVE ###
out=$(printf "Apple\napple\nMILK\nmilk\nbread\n" | ./shoppinglist)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "$(printf "Apple\nbread\nMILK")" ] || ng "$LINENO"

### EMPTY LINES ###
out=$(printf "apple\n\nmilk\n\nbread\n" | ./shoppinglist)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "$(printf "apple\nbread\nmilk")" ] || ng "$LINENO"

### COUNT OPTION ###
out=$(printf "apple\nmilk\napple\nbread\nmilk\napple\n" | ./shoppinglist -c)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "$(printf "apple 3\nbread 1\nmilk 2")" ] || ng "$LINENO"

### EMPTY INPUT ###
out=$(printf "" | ./shoppinglist)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit "$res"
### LONG COUNT OPTION ###
out=$(printf "apple\nmilk\napple\nbread\nmilk\napple\n" | ./shoppinglist --count)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "$(printf "apple 3\nbread 1\nmilk 2")" ] || ng "$LINENO"

### COUNT WITH EMPTY LINES AND CASE INSENSITIVE ###
out=$(printf "Apple\napple\n\nMILK\nmilk\nbread\n" | ./shoppinglist -c)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "$(printf "Apple 2\nbread 1\nMILK 2")" ] || ng "$LINENO"
