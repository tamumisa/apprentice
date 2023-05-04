#!/bin/bash
echo "パスワードマネージャーへようこそ!"
echo "サービス名を入力してください："
read NAME
echo "ユーザー名を入力してください："
read USER
echo "パスワードを入力してください："
read PASS
echo "サービス名：${NAME}ユーザー名:${USER}パスワード：${PASS}" >> "PASSWORD_FILE.txt"
echo "Thankyou!"