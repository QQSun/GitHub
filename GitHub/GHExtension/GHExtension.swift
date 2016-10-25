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
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14);
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

public extension UILabel {
    public class func createLabel(text: String, font: UIFont?, textColor: UIColor?, textAlignment: NSTextAlignment?) -> UILabel {
        let lable: UILabel = UILabel();
        lable.text = text;
        lable.font = font;
        lable.textColor = textColor;
        
        
        if textAlignment == nil {
            lable.textAlignment = NSTextAlignment.left;
        }else{
            lable.textAlignment = textAlignment!;
        }
        if font == nil {
            lable.font = UIFont.systemFont(ofSize: 12);
        }else{
            lable.font = font!;
        }
        
        if textColor == nil {
            lable.textColor = kSubTitleColor;
        }else{
            lable.textColor = textColor!;
        }
        
        return lable;
    }
}

