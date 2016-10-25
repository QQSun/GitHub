//
//  GHRepositoryCell.swift
//  GitHub
//
//  Created by nachuan on 2016/10/24.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import UIKit

private let kTitleRightOffset = 100;


class GHRepositoryCell: GHTableViewCell {

    var avatarImage: UIImageView!
    var titleLabel: UILabel!
    var starLabel: UILabel!
    var ownerLabel: UILabel!
    
    var rankLabel: UILabel!
    var httpLabel: UILabel!
    var descriptionLabel: UILabel!
    
    
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        avatarImage = UIImageView.init()
        avatarImage.backgroundColor = UIColor.red;
        avatarImage.layer.cornerRadius = 5;
        avatarImage.layer.masksToBounds = true;
        self.contentView .addSubview(avatarImage);
        
        
        
        titleLabel = UILabel.init();
        titleLabel.text = "GitHub";
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14);
        titleLabel.textColor = kTitleColor;
        titleLabel.textAlignment = NSTextAlignment.left;
        self.contentView .addSubview(titleLabel);
        
        starLabel = UILabel.init();
        starLabel.text = "star:222";
        starLabel.font = UIFont.systemFont(ofSize: 12);
        starLabel.textColor = kSubTitleColor;
        starLabel.textAlignment = NSTextAlignment.left;
        self.contentView.addSubview(starLabel);
        
        ownerLabel = UILabel.init();
        ownerLabel.text = "owner: sokon";
        ownerLabel.font = UIFont.systemFont(ofSize: 12);
        ownerLabel.textColor = kSubTitleColor;
        ownerLabel.textAlignment = NSTextAlignment.left;
        self.contentView.addSubview(ownerLabel);
        
        rankLabel = UILabel.init();
        rankLabel = UILabel.init();
        rankLabel.text = "rank:222";
        rankLabel.font = UIFont.systemFont(ofSize: 12);
        rankLabel.textColor = kSubTitleColor;
        rankLabel.textAlignment = NSTextAlignment.left;
        self.contentView.addSubview(rankLabel);
        
        
        httpLabel = UILabel.init();
        httpLabel = UILabel.init();
        httpLabel = UILabel.init();
        httpLabel.text = "https://www.2345.com/";
        httpLabel.font = UIFont.systemFont(ofSize: 12);
        httpLabel.textColor = kHttpColor;
        httpLabel.textAlignment = NSTextAlignment.left;
        self.contentView.addSubview(httpLabel);
        
        descriptionLabel = UILabel();
        descriptionLabel = UILabel.init();
        descriptionLabel.text = "category: GestureExclusion, enable_level: 0, persist_level: 0, default_ttl: 1, info_ttl: 0, debug_ttl: 0,";
        descriptionLabel.numberOfLines = 2;
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 12);
        descriptionLabel.textColor = kSubTitleColor;
        descriptionLabel.textAlignment = NSTextAlignment.left;
        self.contentView.addSubview(descriptionLabel);
        
   
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        avatarImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(15);
            make.width.height.equalTo(60);
        };
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10);
            make.left.equalTo(avatarImage.snp.right).offset(10);
            make.height.equalTo(20);
            make.right.equalTo(-kTitleRightOffset);
        };
        
        starLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10);
            make.right.equalTo(-10);
            make.height.equalTo(20);
            make.left.equalTo(titleLabel.snp.right);
        };
        
        ownerLabel.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(titleLabel);
            make.top.equalTo(titleLabel.snp.bottom);
        };

        rankLabel.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(starLabel);
            make.top.equalTo(starLabel.snp.bottom);
        };
        
        httpLabel.snp.makeConstraints { (make) in
            make.left.height.equalTo(ownerLabel);
            make.right.equalTo(0);
            make.top.equalTo(ownerLabel.snp.bottom);
        };

        descriptionLabel.snp.remakeConstraints { (make) in
            make.left.right.equalTo(httpLabel);
            make.top.equalTo(httpLabel.snp.bottom);
            make.height.equalTo(40);
        };
        
        
        
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
