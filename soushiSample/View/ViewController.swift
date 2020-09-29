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

class ViewController: UIViewController, CAAnimationDelegate {
    
    
    private let screenHeight = UIScreen.main.bounds.height
    private let screenWidth = UIScreen.main.bounds.width
    private var statusBarHeight: CGFloat = 0
    private let colors = Colors()
    
    private let headerView = UIView()
    private let reloadButton = UIButton()
    private let chatButton = UIButton()
    private let contentTitleView = UIView()
    private let covidImageView = UIImageView()
    
    private let contentView = UIView()
    private var contentCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private let healthButton = UIButton()
    private let prefectureButton = UIButton()
    
    private var totalResult: Total?
    private var prefectureResult: [Prefecture]?
    
    let contentTitles = ["PCR数", "感染者数", "入院者数", "重傷者数", "死者数", "退院者数"]
    var contentNumberTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("height: ", screenHeight)
        print("width: ", screenWidth)
        
        initCollectionView()
        
        getTotal { (total) in
            self.totalResult = total
            self.contentNumberTitles = self.createNumberLabels(total: total)
            DispatchQueue.main.async {
                self.contentCollectionView.reloadData()
            }
        }
        
        getPrefecture { (prefectures) in
            self.prefectureResult = prefectures
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        
        self.view.backgroundColor = .systemGray6
        contentCollectionView.reloadData()
        setupHeaderView()
        setupHeaderButton(button: reloadButton, image: UIImage(named: "reload")!, position: .left)
        setupHeaderButton(button: chatButton, image: UIImage(named: "chat")!, position: .right)

        setupContentView()
        setupContentTitleView()
        contentCollectionView.backgroundColor = .clear
        setupBottomButtons(button: healthButton, title: "健康管理", topAnchor: contentView.bottomAnchor, constraint: screenHeight * 0.05)
        setupBottomButtons(button: prefectureButton, title: "県別状況", topAnchor: healthButton.bottomAnchor, constraint: screenHeight * 0.03)
        
        reloadButton.addTarget(self, action: #selector(tappedReloadButton(_:)), for: .touchUpInside)
        chatButton.addTarget(self, action: #selector(tappedChatButton(_:)), for: .touchUpInside)
        healthButton.addTarget(self, action: #selector(tappedHealthButton(_:)), for: .touchUpInside)
        prefectureButton.addTarget(self, action: #selector(tappedPrefectureButton(_:)), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let rorate = CABasicAnimation(keyPath: "transform.rotation")
        rorate.duration = 0.6
        rorate.fromValue = CGFloat(Double.pi / 180) * -45
        rorate.repeatCount = 1
        
        let move = CABasicAnimation(keyPath: "position")
        move.duration = 0.6
        move.fromValue = [screenWidth, contentTitleView.frame.height / 2]
        
        covidImageView.layer.add(rorate, forKey: "rorate")
        covidImageView.layer.add(move, forKey: "move")
    }
    
    private  func getTotal(completion: @escaping (Total) -> Void) {
        guard let url = URL(string: "https://covid19-japan-web-api.now.sh/api//v1/total") else { return }
        let request = URLRequest(url: url)
        let decoder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: request) { (data, res, error) in
            do {
                let json = try decoder.decode(Total.self, from: data!)
                completion(json)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    private func getPrefecture(completion: @escaping ([Prefecture]) -> Void) {
        guard let url = URL(string: "https://covid19-japan-web-api.now.sh/api/v1/prefectures") else { return }
        let request = URLRequest(url: url)
        let decoder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: request) { (data, res, error) in
            do {
                let json = try decoder.decode([Prefecture].self, from: data!)
                completion(json)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    private func createNumberLabels(total: Total?) -> [String]{
        var titles = [String]()
        if let total = total {
            titles.append(String(total.pcr))
            titles.append(String(total.positive))
            titles.append(String(total.hospitalize))
            titles.append(String(total.severe))
            titles.append(String(total.death))
            titles.append(String(total.discharge))
        }
        return titles
    }
    //MARK: Button tapped
    @objc func tappedReloadButton(_ sender: UIButton) {
        self.viewDidLoad()
    }
    
    @objc func tappedChatButton(_ sender: UIButton) {
        
    }
    
    @objc func tappedHealthButton(_ sender: UIButton) {
        
    }
    
    @objc func tappedPrefectureButton(_ sender: UIButton) {
        
    }
    
    //MARK: UI
    private func setupHeaderView() {
        
        headerView.backgroundColor = .clear
        self.view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        let gradietLayer = CAGradientLayer()
        gradietLayer.colors = [colors.darkBlue.cgColor, colors.lightBlue.cgColor]
        gradietLayer.frame = headerView.bounds
        headerView.layer.addSublayer(gradietLayer)
    }
    
    private func setupHeaderButton(button: UIButton, image: UIImage, position: Position) {
        button.imageView?.contentMode = .scaleAspectFill
        button.setImage(image, for: .normal)
        self.headerView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: headerView.topAnchor, constant: statusBarHeight+5).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        if(position == .left){
            button.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20).isActive = true
        } else {
            button.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -20).isActive = true
        }
    }
    
    private func setupContentTitleView() {
        
        let titleLabel = UILabel()
        titleLabel.text = "Covid in Japan"
        titleLabel.font = .systemFont(ofSize: CGFloat(screenWidth*0.08), weight: .heavy)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        contentTitleView.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: contentTitleView.centerYAnchor).isActive = true
        
        covidImageView.image = UIImage(named: "covid")
        covidImageView.contentMode = .scaleAspectFill
        contentTitleView.addSubview(covidImageView)
        covidImageView.translatesAutoresizingMaskIntoConstraints = false
        covidImageView.heightAnchor.constraint(equalToConstant: screenWidth*0.13).isActive = true
        covidImageView.widthAnchor.constraint(equalToConstant: screenWidth*0.13).isActive = true
        covidImageView.centerYAnchor.constraint(equalTo: contentTitleView.centerYAnchor).isActive = true
        covidImageView.rightAnchor.constraint(equalTo: contentTitleView.rightAnchor).isActive = true
        
        contentTitleView.center.x = screenWidth / 2
        headerView.addSubview(contentTitleView)
        contentTitleView.translatesAutoresizingMaskIntoConstraints = false
        contentTitleView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -20).isActive = true
        contentTitleView.widthAnchor.constraint(equalToConstant: screenWidth*0.72).isActive = true
        contentTitleView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: (screenWidth*0.13)/4).isActive = true
        
//        contentTitleView.backgroundColor = .yellow
    }
    
    private func setupContentView() {
        
        contentView.backgroundColor = colors.contentBgColor
        contentView.layer.cornerRadius = 30
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = CGSize(width: 5, height: 5)
        contentView.layer.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
        contentView.layer.shadowOpacity = 5
        headerView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45).isActive = true
        contentView.centerYAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        self.contentView.addSubview(contentCollectionView)
        contentCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (screenHeight*0.45)*0.12).isActive = true
        contentCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(screenHeight*0.45)*0.12).isActive = true
        contentCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: (screenWidth*0.45)*0.2).isActive = true
        contentCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -(screenWidth*0.45)*0.2).isActive = true
    }
    
    private func initCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width * 0.34, height: 60)
        //(contentCollectionViewの高さ - 要素の高さの和) / 余白の数
        layout.minimumLineSpacing = (screenHeight * 0.45 * 0.76 - 180) / 2
        contentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentCollectionView.backgroundColor = .yellow
        contentCollectionView.dataSource = self
        contentCollectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func setupBottomButtons(button: UIButton, title: String, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constraint: CGFloat) {
        let KernAttr = [NSAttributedString.Key.kern: 5]
        button.titleLabel!.attributedText = NSMutableAttributedString(string: title, attributes: KernAttr)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.setTitleColor(colors.darkBlue, for: .normal)
        button.titleLabel?.textAlignment = .center
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor, constant: constraint).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentNumberTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = contentCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ContentCollectionViewCell
        cell.titleLabel.text = contentTitles[indexPath.row]
        cell.numberLabel.text = contentNumberTitles[indexPath.row]
        return cell
    }
}

enum Position {
    case left
    case right
}

/*
 https://covid19-japan-web-api.now.sh/api//v1/prefectures
 [{
 id: 1,
 name_ja: "北海道",
 name_en: "Hokkaido",
 lat: 43.46722222,
 lng: 142.8277778,
 population: 5248552,
 last_updated: {
 cases_date: 20200917,
 deaths_date: 20200917,
 pcr_date: 20200917,
 hospitalize_date: 20200917,
 severe_date: 20200917,
 discharge_date: 20200917,
 symptom_confirming_date: 20200917
 },
 cases: 1892,
 deaths: 106,
 pcr: 50527,
 hospitalize: 62,
 severe: 2,
 discharge: 1724,
 symptom_confirming: 0
 },]
 */

/*
 https://covid19-japan-web-api.now.sh/api//v1/total
 {
 date: 20200917,
 pcr: 1789960,
 hospitalize: 6267,
 positive: 77721,
 severe: 167,
 discharge: 69882,
 death: 1486,
 symptom_confirming: 50
 }
 */
