//
//  GHGlobal.swift
//  GitHub
//
//  Created by nachuan on 2016/10/21.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import Foundation
import UIKit


/// 获取UIColor
///
/// - parameter r: 红色值 (0~255)
/// - parameter g: 绿色值 (0~255)
/// - parameter b: 蓝色值 (0~255)
/// - parameter a: 透明的 (0~1)
func RGBA (_ red: Float, green: Float, blue: Float, alpha: Float) ->UIColor {
    return UIColor.init(colorLiteralRed: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha);
}

let kBGColor = RGBA(240, green: 240, blue: 240, alpha: 1);

let kMainColor = RGBA(125, green: 16, blue: 138, alpha: 1);
		
let kScreenWidth: CGFloat = UIScreen.main.bounds.width;

let kScreenWidth_2: CGFloat = kScreenWidth / 2.0;

let kScreenHeight: CGFloat = UIScreen.main.bounds.height;

let kScreenHeight_2: CGFloat = kScreenHeight / 2.0;

let kTitleColor = RGBA(0, green: 0, blue: 0, alpha: 1);

let kSubTitleColor = RGBA(40, green: 40, blue: 40, alpha: 1);

let kHttpColor = RGBA(49, green: 108, blue: 187, alpha: 1);


let kNavigationBarHeight: CGFloat = 64;


