//
//  ContentCollectionViewCell.swift
//  soushiSample
//
//  Created by 黑田光 on 2020/09/29.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//

import Foundation
import UIKit

class ContentCollectionViewCell: UICollectionViewCell {
    
    private let screenWidth = UIScreen.main.bounds.width
    private let colors = Colors()
    
    let titleLabel = UILabel()
    let numberLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        titleLabel.text = "default"
        titleLabel.font = .boldSystemFont(ofSize: CGFloat(screenWidth*0.05))
        titleLabel.textColor = colors.darkBlue
        self.contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        
        numberLabel.text = "default"
        numberLabel.font = .systemFont(ofSize: CGFloat(screenWidth*0.09), weight: .heavy)
        numberLabel.textColor = colors.lightBlue
        self.contentView.addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        numberLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
    }
}
