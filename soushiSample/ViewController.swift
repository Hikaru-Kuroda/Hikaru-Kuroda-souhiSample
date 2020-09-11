//
//  ViewController.swift
//  soushiSample
//
//  Created by 黑田光 on 2020/09/07.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let screenHeight = UIScreen.main.bounds.height
    
    let firstView = UIView()
    let secondView = UIView()
    let thirdView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }


}

extension ViewController {
    func setupViews() {
        self.view.backgroundColor = .systemGray6
        
        setupFirstView()
        setupSecondView()
        setupThirdView()
    }
    
    func setupFirstView() {
        let label = UILabel()
        label.text = "This is FirstView"
        firstView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: firstView.centerYAnchor, constant: -10).isActive = true
        label.centerXAnchor.constraint(equalToSystemSpacingAfter: firstView.centerXAnchor, multiplier: 0).isActive = true
        
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        firstView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: firstView.centerYAnchor, constant: 10).isActive = true
        button.centerXAnchor.constraint(equalToSystemSpacingAfter: firstView.centerXAnchor, multiplier: 0).isActive = true
        
        firstView.backgroundColor = .white
        firstView.layer.cornerRadius = 20
        firstView.layer.shadowColor = UIColor.black.cgColor
        firstView.layer.shadowOpacity = 0.2
        firstView.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.view.addSubview(firstView)
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        firstView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: screenHeight * 0.15).isActive = true
        firstView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
    func setupSecondView() {
        let label = UILabel()
        label.text = "This is SecondView"
        secondView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: secondView.centerYAnchor, constant: -10).isActive = true
        label.centerXAnchor.constraint(equalToSystemSpacingAfter: secondView.centerXAnchor, multiplier: 0).isActive = true
        
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        secondView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: secondView.centerYAnchor, constant: 10).isActive = true
        button.centerXAnchor.constraint(equalToSystemSpacingAfter: secondView.centerXAnchor, multiplier: 0).isActive = true
        
        secondView.backgroundColor = .white
        secondView.layer.cornerRadius = 20
        secondView.layer.shadowColor = UIColor.black.cgColor
        secondView.layer.shadowOpacity = 0.2
        secondView.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.view.addSubview(secondView)
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        secondView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 30).isActive = true
        secondView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
    func setupThirdView() {
        let label = UILabel()
        label.text = "This is ThirdView"
        thirdView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: thirdView.centerYAnchor, constant: -10).isActive = true
        label.centerXAnchor.constraint(equalToSystemSpacingAfter: thirdView.centerXAnchor, multiplier: 0).isActive = true
        
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        thirdView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: thirdView.centerYAnchor, constant: 10).isActive = true
        button.centerXAnchor.constraint(equalToSystemSpacingAfter: thirdView.centerXAnchor, multiplier: 0).isActive = true
        
        thirdView.backgroundColor = .white
        thirdView.layer.cornerRadius = 20
        thirdView.layer.shadowColor = UIColor.black.cgColor
        thirdView.layer.shadowOpacity = 0.2
        thirdView.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.view.addSubview(thirdView)
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        thirdView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        thirdView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        thirdView.topAnchor.constraint(equalTo: secondView.bottomAnchor, constant: 30).isActive = true
        thirdView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
}

