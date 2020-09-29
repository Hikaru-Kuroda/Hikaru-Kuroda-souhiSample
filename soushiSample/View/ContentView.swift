//
//  ContentView.swift
//  soushiSample
//
//  Created by 黑田光 on 2020/09/29.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//

import Foundation
import UIKit

class ContentView: UIView {
    private let screenWidth = UIScreen.main.bounds.width
    private let colors = Colors()
    private let titleLabel = UILabel()
    private let numberLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        titleLabel.text = "default"
        titleLabel.font = .boldSystemFont(ofSize: CGFloat(screenWidth*0.05))
        titleLabel.textColor = colors.darkBlue
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        numberLabel.text = "default"
        numberLabel.font = .systemFont(ofSize: CGFloat(screenWidth*0.09), weight: .heavy)
        numberLabel.textColor = colors.lightBlue
        self.addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
        numberLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    }
}
