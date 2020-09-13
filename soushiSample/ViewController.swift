//
//  ViewController.swift
//  soushiSample
//
//  Created by 黑田光 on 2020/09/07.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//

//ここから見つけました
//https://colorhunt.co/palette/196224

import UIKit

class ViewController: UIViewController {
    
    private let screenHeight = UIScreen.main.bounds.height
    private let screenWidth = UIScreen.main.bounds.width
    
    private let scrollView = UIScrollView()
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    private let fourthView = UIView()
    private let fifthView = UIView()
    private let sixthView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
        setUpContents()
    }
    
    //オートレイアウトの実装方法が分からなかったのでframeで大きさを決めました
    private func setUpScrollView() {
        scrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        //各viewの高さに余白の高さを足して6倍、最後のViewの下部に余白をつくる
        let contentHeihgt = (screenHeight * 0.2 + 60) * 6 + 60
        scrollView.contentSize = CGSize(width: screenWidth, height: contentHeihgt)
        self.view.addSubview(scrollView)
    }
    
    private func setUpContents() {
        let gradientColors = [Colors().darkGray.cgColor, Colors().cyan.cgColor, Colors().lightGreen.cgColor]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.contentSize.height)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        //上のviewから60の余白を作る
        setUpContent(uiView: firstView, labelTitle: "FirstView", buttonTitle: "Button", topAnchor: scrollView.topAnchor, topConstrait: 60)
        setUpContent(uiView: secondView, labelTitle: "SecondView", buttonTitle: "button", topAnchor: firstView.bottomAnchor, topConstrait: 60)
        setUpContent(uiView: thirdView, labelTitle: "ThirdView", buttonTitle: "Button", topAnchor: secondView.bottomAnchor, topConstrait: 60)
        setUpContent(uiView: fourthView, labelTitle: "FourthView", buttonTitle: "Button", topAnchor: thirdView.bottomAnchor, topConstrait: 60)
        setUpContent(uiView: fifthView, labelTitle: "FifthView", buttonTitle: "Button", topAnchor: fourthView.bottomAnchor, topConstrait: 60)
        setUpContent(uiView: sixthView, labelTitle: "SixthView", buttonTitle: "Button", topAnchor: fifthView.bottomAnchor, topConstrait: 60)
    }
    
    private func setUpContent(uiView: UIView, labelTitle: String, buttonTitle: String,
                              topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,topConstrait: CGFloat) {
        setUpLabel(uiView: uiView, title: labelTitle)
        setUpButton(uiView: uiView, title: buttonTitle)
        setUpView(uiView: uiView, topAnchor: topAnchor, topConstrait: topConstrait)
    }
    
    private func setUpView(uiView: UIView, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,topConstrait: CGFloat) {
        uiView.backgroundColor = Colors().white
        uiView.layer.cornerRadius = 20
        uiView.layer.shadowColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
        uiView.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.scrollView.addSubview(uiView)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8).isActive = true
        uiView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.2).isActive = true
        uiView.topAnchor.constraint(equalTo: topAnchor, constant: topConstrait).isActive = true
        uiView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
    }

    private func setUpLabel(uiView: UIView, title: String) {
        let label = UILabel()
        label.text = title
        label.textColor = .black
        uiView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: uiView.centerYAnchor, constant: -10).isActive = true
        label.centerXAnchor.constraint(equalToSystemSpacingAfter: uiView.centerXAnchor, multiplier: 0).isActive = true
    }
    
    private func setUpButton(uiView: UIView, title: String) {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        uiView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: uiView.centerYAnchor, constant: 10).isActive = true
        button.centerXAnchor.constraint(equalToSystemSpacingAfter: uiView.centerXAnchor, multiplier: 0).isActive = true
    }

}

