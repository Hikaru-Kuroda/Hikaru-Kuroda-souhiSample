//
//  Fix7.swift
//  soushiSample
//
//  Created by TanakaSoushi on 2020/09/17.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//
/*
 課題7
 デザインのコツや配色パターンはこれまで紹介した通りです。意識することは意外とそんなにありません。
 あとは、ストレートな色を使わないことですね。淡さを取り入れることで、目に優しいデザインになります。
 それではいよいよ非同期処理であるAPI通信を始めていきたいと思います。
 
 コロナチェッカーで使用したAPIをまず紹介します
 https://covid19-japan-web-api.now.sh/api//v1/prefectures
 https://covid19-japan-web-api.now.sh/api//v1/total
 上が県別の情報で、下が各県の総数を受け取っています。
 
 まずはこれらをリクエストを投げて取得できる状態にしたいです。
 API通信を行う上でまず確認することは、APIを投げた時、どんな配列でJSONデータが返ってくるのかどうかです。
 URLにアクセスし、JSONViewなどのChrome拡張機能でJson配列を見やすくして、
 どんなデータが返ってきてるのかを確認しましょう。
 確認できたら、その配列をコピーして貼り付けてください。
 今回はそこまでで大丈夫です！
 
 **/
