//
//  GHExtension.swift
//  GitHub
//
//  Created by nachuan on 2016/10/21.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import Foundation
import UIKit

public extension UIBarButtonItem {
    public class func createBarButtonItem(_ title: String?, imageNamed: String?, target: AnyObject?, action: Selector, for controlEvents: UIControlEvents) -> UIBarButtonItem {
        let btn = UIButton.init();
        btn.setTitle(title, for: UIControlState.normal);
        if imageNamed != nil {
            btn.setImage(UIImage.init(named: imageNamed!), for: UIControlState.normal);
            btn.setImage(UIImage.init(named: imageNamed! + "_highlighted"), for: UIControlState.selected);
        }
        btn.adjustsImageWhenHighlighted = false;
        btn.addTarget(target, action: action, for: controlEvents);
        btn.sizeToFit();
        let item = UIBarButtonItem.init(customView: btn);
        return item;
    }
}


