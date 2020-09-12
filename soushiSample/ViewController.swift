//
//  ViewController.swift
//  soushiSample
//
//  Created by 黑田光 on 2020/09/07.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let screenHeight = UIScreen.main.bounds.height
    
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpContents()
    }
    
    private func setUpContents() {
        self.view.backgroundColor = .systemGray6
    
        setUpLabel(uiView: firstView, title: "This is FirstView")
        setUpButton(uiView: firstView, title: "Button")
        setUpView(uiView: firstView, topAnchor: view.topAnchor, topConstrait: screenHeight * 0.15)
        
        setUpLabel(uiView: secondView, title: "This is SecondView")
        setUpButton(uiView: secondView, title: "Button")
        setUpView(uiView: secondView, topAnchor: firstView.bottomAnchor, topConstrait: 20)
        
        setUpLabel(uiView: thirdView, title: "This is ThirdView")
        setUpButton(uiView: thirdView, title: "Button")
        setUpView(uiView: thirdView, topAnchor: secondView.bottomAnchor, topConstrait: 20)
    }
    
    private func setUpView(uiView: UIView, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,topConstrait: CGFloat) {
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 20
        uiView.layer.shadowColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 0.2)
        self.view.addSubview(uiView)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        uiView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        uiView.topAnchor.constraint(equalTo: topAnchor, constant: topConstrait).isActive = true
        uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }

    private func setUpLabel(uiView: UIView, title: String) {
        let label = UILabel()
        label.text = title
        label.textColor = .black
        uiView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: uiView.centerYAnchor, constant: -20).isActive = true
        label.centerXAnchor.constraint(equalToSystemSpacingAfter: uiView.centerXAnchor, multiplier: 0).isActive = true
    }
    
    private func setUpButton(uiView: UIView, title: String) {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        uiView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: uiView.centerYAnchor, constant: 20).isActive = true
        button.centerXAnchor.constraint(equalToSystemSpacingAfter: uiView.centerXAnchor, multiplier: 0).isActive = true
    }

}

