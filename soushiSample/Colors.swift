//
//  Colors.swift
//  soushiSample
//
//  Created by 黑田光 on 2020/09/12.
//  Copyright © 2020 Hikaru Kuroda. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    let white: UIColor = .rgb(r: 238, g: 238, b: 238, alpha: 1)
    let darkGray: UIColor = .rgb(r: 57, g: 62, b: 70, alpha: 1)
    let cyan: UIColor = .rgb(r: 118, g: 234, b: 215, alpha: 1)
    let lightGreen: UIColor = .rgb(r: 196, g: 251, b: 109, alpha: 1)
}
//自分がコロナチェッカーで使った配色です。
//http://photoshopvip.net/95427を参考に、
//同円周上の色を取得しています。
//円周上からどの規則で選択してくかによって、与える印象が180度変わります。
//1つおきなのか、３角形なのか、四角形なのか、隣り合う色なのか,,etc
struct Colors2 {
    let bluePurple:UIColor = .init(red: 87/255, green: 99/255, blue: 175/255, alpha: 1)
    let blue:UIColor = .init(red: 92/255, green: 137/255, blue: 200/255, alpha: 1)
    let blueGreen:UIColor = .init(red: 86/255, green: 196/255, blue: 197/255, alpha: 1)
    let green:UIColor = .init(red: 100/255, green: 194/255, blue: 150/255, alpha: 1)
    let yellowGreen:UIColor = .init(red: 173/255, green: 215/255, blue: 134/255, alpha: 1)
    let yellow:UIColor = .init(red: 251/255, green: 245/255, blue: 131/255, alpha: 1)
    let yellowOrange:UIColor = .init(red: 252/255, green: 200/255, blue: 120/255, alpha: 1)
    let orange:UIColor = .init(red: 246/255, green: 169/255, blue: 115/255, alpha: 1)
    let redOrange:UIColor = .init(red: 245/255, green: 141/255, blue: 116/255, alpha: 1)
    let red:UIColor = .init(red: 245/255, green: 121/255, blue: 109/255, alpha: 1)
    let redPurple:UIColor = .init(red: 190/255, green: 125/255, blue: 181/255, alpha: 1)
    let purple:UIColor = .init(red: 129/255, green: 107/255, blue: 177/255, alpha: 1)
    let white:UIColor = .systemGray6
    let black:UIColor = .init(red: 0, green: 0, blue: 0, alpha: 0.9)
}
