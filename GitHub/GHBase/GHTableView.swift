//
//  GHTableView.swift
//  GitHub
//
//  Created by nachuan on 2016/10/20.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import UIKit

class GHTableView: UITableView {
    
//    var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0);
//    var style: UITableViewStyle = UITableViewCellStyle.plain;
    
    
    
    override public init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style);
        self.separatorStyle = UITableViewCellSeparatorStyle.singleLine;
        self.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
        self.scrollIndicatorInsets = self.contentInset;
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
