/*
 https://covid19-japan-web-api.now.sh/api//v1/prefectures
 {
     id: 1,
     name_ja: "北海道",
     name_en: "Hokkaido",
     lat: 43.46722222,
     lng: 142.8277778,
     population: 5248552,
     last_updated: {
     cases_date: 20200917,
     deaths_date: 20200917,
     pcr_date: 20200917,
     hospitalize_date: 20200917,
     severe_date: 20200917,
     discharge_date: 20200917,
     symptom_confirming_date: 20200917
     },
     cases: 1892,
     deaths: 106,
     pcr: 50527,
     hospitalize: 62,
     severe: 2,
     discharge: 1724,
     symptom_confirming: 0
},
 */

/*
 https://covid19-japan-web-api.now.sh/api//v1/total
 {
     date: 20200917,
     pcr: 1789960,
     hospitalize: 6267,
     positive: 77721,
     severe: 167,
     discharge: 69882,
     death: 1486,
     symptom_confirming: 50
 }
 */

/**
 さて、返却されたJSONデータを確認できました。
 どんな形式でしょうか？
 よくみてみると、prefecturesは[ ]で囲まれていますね。その部分も抜き出していたら100点です！
 一方で、totalには[]がついていません。
 なぜでしょう？
 答えは簡単で、prefecturesはデータが複数あるので配列になっていますが、
 totalはデータが１つなので配列になっていません。
 マッピングをする上で、ここに気づくことはとても大切です。
 なぜなら、マッピングしたい変数の型が違うと、上手くマッピングされずにnilになるからです。
 ですが、ビルドでエラーが吐かれることはありません。nilとして返されるだけです。
 復讐したところで次の課題にいきましょう。
 
 課題8
 帰って来たJSONデータをマッピングしたいです。
 コロナの感染状況を取得する上で、帰って来たJSONデータからどの値を抜き出したら良いでしょうか？
 感染者数、死者数、自分で考え、Codableでマッピング用の構造体を作成しましょう。
 今回はそこまでで大丈夫です。
 「APIリクエスト codable swift 」「codable swift」などで出てくるでしょうか?
 */

import UIKit

class Task8: NSObject {

}

