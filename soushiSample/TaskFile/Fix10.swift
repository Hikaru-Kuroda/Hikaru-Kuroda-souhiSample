/*
 Fixになります。
 getTotal()
 getPrefecture()
 の下の行で、グローバル変数のtotalResult、totalPrefectureにアクセスしたのですが、
 nilになりました。何か処理が足りないようです。
 非同期処理は、リクエストを投げる関数でエスケープ処理をしてあげないと
 そのデータを外部に持ち越すことができません。
 
 getTotal()
 getPrefecture()
 の下の行でtotalResult、totalPrefectureにアクセスできるよう、修正AZ
 **/
