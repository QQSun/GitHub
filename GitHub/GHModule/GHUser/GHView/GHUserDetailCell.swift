//
//  GHUserDetailCell.swift
//  GitHub
//
//  Created by nachuan on 2016/10/24.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import UIKit
private let kTitleRightOffset = 100;


class GHUserDetailCell: GHTableViewCell {

    var rankLabel: UILabel!;
    var titleLabel: UILabel!;
    var languageLabel: UILabel!;
    var starLable: UILabel!
    var descriptionLabel: UILabel!;
    
    
    
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.selectionStyle = UITableViewCellSelectionStyle.none;
        rankLabel = UILabel.createLabel("1", font: UIFont.boldSystemFont(ofSize: 14), textColor: kTitleColor, textAlignment: nil);
        self.contentView.addSubview(rankLabel);
        
        titleLabel = UILabel.createLabel("MJRefresh", font: UIFont.boldSystemFont(ofSize: 14), textColor: kTitleColor, textAlignment: nil);
        self.contentView.addSubview(titleLabel);
        
        languageLabel = UILabel.createLabel("Objective-C", font: nil, textColor: nil, textAlignment: nil);
        self.contentView.addSubview(languageLabel);
        
        starLable = UILabel.createLabel("star:3", font: nil, textColor: nil, textAlignment: nil);
        self.contentView.addSubview(starLable);
        
        descriptionLabel = UILabel.createLabel("miaoshi", font: UIFont.boldSystemFont(ofSize: 12), textColor: nil, textAlignment: nil);
        descriptionLabel.numberOfLines = 2;
        self.contentView.addSubview(descriptionLabel);
        
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        rankLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15);
            make.centerY.equalTo(self.contentView);
            make.height.equalTo(20);
            make.width.equalTo(40);
        };
        
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(rankLabel.snp.right).offset(10);
            make.top.equalTo(10);
            make.height.equalTo(20);
            make.right.equalTo(-kTitleRightOffset);
        };
        
        starLable.snp.makeConstraints { (make) in
            make.top.height.equalTo(titleLabel);
            make.right.equalTo(-10);
            make.left.equalTo(titleLabel.snp.right).offset(10);
        };
        
        languageLabel.snp.makeConstraints { (make) in
            make.left.height.equalTo(titleLabel);
            make.top.equalTo(titleLabel.snp.bottom);
            make.right.equalTo(-10);
        };
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(languageLabel);
            make.right.equalTo(-10);
            make.height.equalTo(30);
            make.top.equalTo(languageLabel.snp.bottom);
        };
        
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
