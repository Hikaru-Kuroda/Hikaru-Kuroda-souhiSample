//
//  ViewController.swift
//  soushiSample
//
//  Created by 黑田光 on 2020/09/07.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }


}

extension ViewController {
    func setupViews() {
        self.view.backgroundColor = .systemGray6
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = "Label"
        label.textColor = .black
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
        let button = UIButton(frame: CGRect(x:0, y: 0, width: 100, height: 30))
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
        
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

