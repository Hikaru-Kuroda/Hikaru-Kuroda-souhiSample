
    /*
    Fix案件です。
     ・小コンテンツのUIViewの背景は白で、scrollView部分の背景を好きな色にして
     　それに合わせてヘッダーとフッターの色を合わせてみてください。
       (全体がモノトーンになる配色以外にしてみてください)
     ・以下をpodinstallしてください。
     pod 'RealmSwift'
     pod 'Alamofire', '~> 5.2'
     pod 'SwiftyJSON'
     pod 'FSCalendar'
     pod 'CalculateCalendarLogic'
     pod 'Charts'
     pod 'KRProgressHUD'
     pod 'Firebase/Analytics'
     pod 'Firebase/Auth'
     pod 'Firebase/Core'
     pod 'Firebase/Firestore'
     pod 'FirebaseFirestoreSwift'
     pod 'MessageKit'
     pod 'MessageInputBar'
     ・インスタンスは使いまわせるのであれば極力使いまわしたいので、Colors構造体のインスタンスを
     　グローバル変数に代入して再利用してください。
 
 　　めちゃめちゃ良いです！コードも画面もめちゃめちゃ良い感じだと思います。
    色の相性も完璧です！
    マテリアルデザインの視点からいくと、ヘッダーの下に影をつけることで
    立体的な階層の違い(ヘッダーの方が上にある)を表現することもあります。(どちらが正解とかはないです)
    
    */



//ここから見つけました
//https://colorhunt.co/palette/196224

import UIKit

class ViewController6: UIViewController {
    
    private let screenHeight = UIScreen.main.bounds.height
    private let screenWidth = UIScreen.main.bounds.width
    private let colors = Colors()
    
    private let headerView = UIView()
    private let scrollView = UIScrollView()
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    private let fourthView = UIView()
    private let fifthView = UIView()
    private let sixthView = UIView()
    private let footerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("height: ", screenHeight)
        print("width: ", screenWidth)
        
        setUpHeader()
        setUpBackgroundScrollView()
        setUpContents()
        setUpFooter()
    }

    private func setUpHeader() {
        headerView.backgroundColor = colors.headerColor
        self.view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        var headerHeight: CGFloat = 70
        if(screenHeight >= 812) {
            headerHeight = 88
        }
        headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = "Title"
        titleLabel.textColor = colors.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
    }
    
    private func setUpFooter() {
        footerView.backgroundColor = colors.headerColor
        self.view.addSubview(footerView)
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        footerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        footerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        var footerViewHeight: CGFloat = 49
        if(screenHeight >= 812) {
            footerViewHeight = 83
        }
        footerView.heightAnchor.constraint(equalToConstant: footerViewHeight).isActive = true
    }
    
    private func setUpBackgroundScrollView() {
        
        var headerHeight: CGFloat = 70
        if(screenHeight >= 812) {
            headerHeight = 88
        }
        scrollView.frame = CGRect(x: 0, y: headerHeight, width: screenWidth, height: screenHeight - headerView.frame.height - footerView.frame.height)
        //各viewの高さに余白の高さを足して6倍、最後のViewの下部に余白をつくる
        let contentHeihgt = (screenHeight * 0.2 + 60) * 6 + 200
        scrollView.contentSize = CGSize(width: screenWidth, height: contentHeihgt)
        self.view.addSubview(scrollView)
    }
    
    private func setUpContents() {
        
        self.view.backgroundColor = colors.bgColor
        //上のviewから60の余白を作る
        setUpContent(uiView: firstView, labelTitle: "FirstView", buttonTitle: "Button", topAnchor: scrollView.topAnchor, topConstrait: 60)
        setUpContent(uiView: secondView, labelTitle: "SecondView", buttonTitle: "Button", topAnchor: firstView.bottomAnchor, topConstrait: 60)
        setUpContent(uiView: thirdView, labelTitle: "ThirdView", buttonTitle: "Button", topAnchor: secondView.bottomAnchor, topConstrait: 60)
        setUpContent(uiView: fourthView, labelTitle: "FourthView", buttonTitle: "Button", topAnchor: thirdView.bottomAnchor, topConstrait: 60)
        setUpContent(uiView: fifthView, labelTitle: "FifthView", buttonTitle: "Button", topAnchor: fourthView.bottomAnchor, topConstrait: 60)
        setUpContent(uiView: sixthView, labelTitle: "SixthView", buttonTitle: "Button", topAnchor: fifthView.bottomAnchor, topConstrait: 60)
    }
    
    private func setUpContent(uiView: UIView, labelTitle: String, buttonTitle: String, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,topConstrait: CGFloat) {
        setUpContentLabel(uiView: uiView, title: labelTitle)
        setUpCOntentButton(uiView: uiView, title: buttonTitle)
        setUpContentView(uiView: uiView, topAnchor: topAnchor, topConstrait: topConstrait)
    }
    
    private func setUpContentView(uiView: UIView, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,topConstrait: CGFloat) {
        uiView.backgroundColor = colors.contentBgColor
        uiView.layer.cornerRadius = 20
        uiView.layer.shadowColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 0.2)
        uiView.layer.shadowOffset = CGSize(width: 5, height: 5)
        uiView.layer.shadowOpacity = 1
        self.scrollView.addSubview(uiView)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8).isActive = true
        uiView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.2).isActive = true
        uiView.topAnchor.constraint(equalTo: topAnchor, constant: topConstrait).isActive = true
        uiView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
    }

    private func setUpContentLabel(uiView: UIView, title: String) {
        let label = UILabel()
        label.text = title
        label.textColor = .black
        uiView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: uiView.centerYAnchor, constant: -10).isActive = true
        label.centerXAnchor.constraint(equalToSystemSpacingAfter: uiView.centerXAnchor, multiplier: 0).isActive = true
    }
    
    private func setUpCOntentButton(uiView: UIView, title: String) {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        uiView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: uiView.centerYAnchor, constant: 10).isActive = true
        button.centerXAnchor.constraint(equalToSystemSpacingAfter: uiView.centerXAnchor, multiplier: 0).isActive = true
    }

}


