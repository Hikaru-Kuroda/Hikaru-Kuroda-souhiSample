//
//  Tasi1.swift
//  soushiSample
//
//  Created by TanakaSoushi on 2020/09/10.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//

import UIKit

class Tasi1: ViewController {
    //ひかるさんは少しペース早めでいきます！
    //課題１
    //コードのみでUILabelとUIButtonを配置してください。
    //シュミレーターに表示されたら成功です
    //課題２
    //コードのみでUIViewを配置し、角丸にして影をつけてください。
    //ViewControllerの背景はUIColor.systemGray6にしてください
    //追記
    //配置等は自由ですが、なるべくきれいに見えるように実装してください！
    //MARK: - Feedbuck
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    //UIButtonのインスタンス生成とframeは別々にしてあげましょう。
    //MARK: - 修正①インスタンス生成では押した時に関数が呼び出せる形にする
    //MARK: - 修正②frameは↑のインスタンスを格納した変数.frame = で設定
    let button = UIButton(frame: CGRect(x:0, y: 0, width: 100, height: 30))
    override func viewDidLoad() {
        //今回のように背景のベースを薄いグレーにするのはデザインでよく見てたものです。
        //そしてよく使っています。
        self.view.backgroundColor = .systemGray6
        
        //コードはこれでokだと思います！SEでviewが見切れますが、ここでは気にせず次に行きます
        //コードの可読性を上げる手法として、レイアウト描画処理をコンテンツごとに関数で分離してあげる手法をよく使います。
        setUpLabel()
        setUpButton()
        setUpView()
    }
    func setUpLabel() {
        label.text = "Label"
        label.textColor = .black
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    func setUpButton() {
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
    }
    func setUpView() {
        let myView = UIView(frame: CGRect(x:0, y: 0, width: 0, height: 0))
        myView.backgroundColor = .white
        myView.layer.cornerRadius = 20
        myView.layer.shadowOpacity = 0.3
        myView.layer.shadowColor = UIColor.black.cgColor
        myView.layer.shadowOffset = CGSize(width: 6, height: 6)
        self.view.addSubview(myView)
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 100).isActive = true
        myView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        myView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        myView.heightAnchor.constraint(equalTo: myView.widthAnchor).isActive = true
    }
}
