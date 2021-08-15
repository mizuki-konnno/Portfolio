# 筋トレ管理 WEB アプリケーション "Power rain"

## サイト概要

<img width="1440" alt="スクリーンショット 2021-07-25 13 01 59" src="https://user-images.githubusercontent.com/81844070/126887524-5bd7404c-d0d7-46ae-9003-357610962a3a.png">

< スポーツジムなどで筋トレを行う際にトレーニング内容や重さや回数を記録し管理するためのサイト。体重など登録していただくことでグラフなどでデータを閲覧することができます。また他のユーザのメニューなど参考にトレーニングの質を高められます。 >

###  url: http://35.75.95.134/

### 使い方

< トレーニング内容を記述していただきさらにその日の体重、体脂肪率などを入力していただくことで自分の体の変化をグラフなどで見ることができます。また他の方のメニューなど参考にしていただけます。 >

### テーマを選んだ理由

< ジムに行くとトレーニング内容などをいつもノートに記入していたのですがそれを管理したいと思ったため。また周りを見ても同じようにメモに残していたりする人も見受けられるためそのような方に使っていただく為に選びました。 >

### ターゲットユーザ

< ジムや家で筋力トレーニングなど体づくりを行う老若男女の方々 >

### 主な利用シーン

< ジムや家で筋肉トレーニングや体づくりを行う際に手軽にトレーニング内容を登録できます。 >

## 設計書

< ER 図 >
< https://drive.google.com/file/d/1tzZXMaLPxUpBcFPoeYtHSc7BExMCzBzP/view?usp=sharing >

< テーブル定義書 >
< https://1drv.ms/x/s!Ag91A9xwiLMkd8XwJZfq5NzuIv4?e=GUAjvF >

< 詳細設計書 >
< https://1drv.ms/x/s!Ag91A9xwiLMkfIsUfA48s62oNWE?e=gsEsdU >

< WBS >
< https://docs.google.com/spreadsheets/d/16YP4TNjiMXS0sU7yZbfJpusP4_JfdSD4QxNRyLcrLic/edit?usp=sharing >

## チャレンジ要素一覧

< https://docs.google.com/spreadsheets/d/16-6JK7xJdFxh4IO2eGq1DuUu05-6MD-EplOM-ULiUx8/edit#gid=0 >

## 開発環境

- OS：Amazon Linux release 2 (Karoo)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9

## 本番環境

- AWS(EC2,RDS)
- Nginx,Pima
- Github actionを用いた自動デプロイ

## 使用技術

- Ruby 2.6.3
- Ruby on Rails 5.2.5
- MySQL 5.7.22
- Nginx
- Puma
- AWS
- RSpec

## 機能一覧

- 会員認証（devise）
- 投稿機能(Ajax)
- フォロー機能(Ajax)
- 検索機能
- ページング機能(kaminari)
- レスポンシブ対応（スマートフォン)
- カレンダー機能（simple_calendar）
- グラフの導入（chartkick）
- RSpecによるテスト（model,requests,system)

## 静的コード解析ツール
- Rudocop

## 使用素材

- 写真素材（フリー）
 O-DANさん
 url;https://o-dan.net/ja/
