//MARK: Fix
// [{
//     id: 1,
//     name_ja: "北海道",
//     name_en: "Hokkaido",
//     lat: 43.46722222,
//     lng: 142.8277778,
//     population: 5248552,
//     last_updated: {
//     cases_date: 20200917,
//     deaths_date: 20200917,
//     pcr_date: 20200917,
//     hospitalize_date: 20200917,
//     severe_date: 20200917,
//     discharge_date: 20200917,
//     symptom_confirming_date: 20200917
//     },
//     cases: 1892,
//     deaths: 106,
//     pcr: 50527,
//     hospitalize: 62,
//     severe: 2,
//     discharge: 1724,
//     symptom_confirming: 0
//},]
//prefectureでは外側の[]をつけてもらいたかったです；；レスポンス投げて受け取る上でここめっちゃ大事なので！
//URLで飛んでよく見たらついてるのがわかると思います。
//あと、entityは同じファイルにまとめてあげましょう！

//MARK: 課題9
//実際にtotalとprefectureに対してgetリクエストで値を拾ってください。
//グローバル変数に代入して、その変数をprintで出力してください。
//nilにならなければ成功です。(少しだけ難易度上げました)
