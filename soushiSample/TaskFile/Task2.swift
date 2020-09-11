
    /*
    課題２
     UILabelとUIButtonで1セットとして、3セット分表示
     またそれぞれUIViewの上に配置する
    */
//
//  ViewController.swift
//  soushiSample
//
//  Created by 黑田光 on 2020/09/07.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    //同じファイル内でしか使われない変数や関数にはprivateをつける
    //こうすることで、外部から参照されないことを保証し、リファクタリングを容易にする
    //大規模になる程、外部からの参照を受けないことの明示は役に立つ
    //extensionで分けるのはDelegate系を推奨。例えばScrollViewDelegateなど
    private let screenHeight = UIScreen.main.bounds.height
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray6
        //冗長性は排除してあげたいので、同じ処理は関数としてまとめるのを推奨
        setUpContents()
        
    }
    private func setUpContents() {
        setUpLabel(uiView: firstView, title: "This is FirstView")
        setUpButton(uiView: firstView, title: "Button")
        setUpVIew(uiView: firstView)
        
        setUpLabel(uiView: secondView, title: "This is SecondView")
        setUpButton(uiView: secondView, title: "Button")
        setUpVIew(uiView: secondView)
        
        setUpLabel(uiView: thirdView, title: "This is ThirdView")
        setUpButton(uiView: thirdView, title: "Button")
        setUpVIew(uiView: thirdView)
    }
    private func setUpVIew(uiView: UIView) {
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 20
//        colorとopacityは.rgbaでまとめて書くことも可
        uiView.layer.shadowColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 0.2)
        uiView.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.view.addSubview(uiView)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        //ストーリーボードを使わずにコーディングで描画するのはappleが推奨していて
        //SwiftUIでもその思想が取り入れられている
        //コーディングで描画するのはこれから役に立つのでこのまま覚えるのを推奨
        uiView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        uiView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        uiView.topAnchor.constraint(equalTo: view.topAnchor, constant: screenHeight * 0.15).isActive = true
        uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    private func setUpButton(uiView: UIView, title: String){
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        uiView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: uiView.centerYAnchor, constant: 10).isActive = true
        button.centerXAnchor.constraint(equalToSystemSpacingAfter: uiView.centerXAnchor, multiplier: 0).isActive = true
    }
    private func setUpLabel(uiView: UIView, title: String) {
        let label = UILabel()
        uiView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: uiView.centerYAnchor, constant: -10).isActive = true
        label.centerXAnchor.constraint(equalToSystemSpacingAfter: uiView.centerXAnchor, multiplier: 0).isActive = true
    }
}

