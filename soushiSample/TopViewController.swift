//
//  TopViewController.swift
//  soushiSample
//
//  Created by 黑田光 on 2020/09/15.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {
    
    private let transitionButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    func setUpView() {
        self.view.backgroundColor = .systemGray6
        
        transitionButton.setTitle("遷移ボタン", for: .normal)
        transitionButton.setTitleColor(.black, for: .normal)
        transitionButton.isEnabled = true
        self.view.addSubview(transitionButton)
        transitionButton.translatesAutoresizingMaskIntoConstraints = false
        transitionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        transitionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        transitionButton.addTarget(self, action: #selector(didTappedTransitionButton(_:)), for: .touchUpInside)
    }
    
    @objc func didTappedTransitionButton(_ sender: UIButton) {
        print("taped button")
        let nextvc = ViewController()
        nextvc.modalPresentationStyle = .fullScreen
        present(nextvc, animated: true, completion: nil)
    }

}
