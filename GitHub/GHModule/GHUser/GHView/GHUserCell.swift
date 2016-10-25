//
//  GHUserCell.swift
//  GitHub
//
//  Created by nachuan on 2016/10/21.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import UIKit

class GHUserCell: GHTableViewCell {

    var avatarImage: UIImageView?;
    var titleLabel: UILabel?;
    var rankLabel: UILabel?;
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        avatarImage = UIImageView.init();
        avatarImage!.layer.cornerRadius = 5;
        avatarImage!.layer.masksToBounds = true;
        avatarImage!.backgroundColor = UIColor.red;
        
        self.contentView.addSubview(avatarImage!);
        
        titleLabel = UILabel();
        titleLabel!.font = UIFont.boldSystemFont(ofSize: 14);
        titleLabel!.text = "GitHub";
        titleLabel!.textColor = kTitleColor;
        titleLabel!.textAlignment = NSTextAlignment.left;
        self.contentView.addSubview(titleLabel!);
        
        rankLabel = UILabel();
        rankLabel!.font = UIFont.systemFont(ofSize: 12);
        rankLabel!.text = "排行榜:No.1";
        rankLabel!.textColor = kSubTitleColor;
        rankLabel!.textAlignment = NSTextAlignment.left;
        self.contentView.addSubview(rankLabel!);
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        avatarImage!.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(10);
            make.bottom.equalTo(-10);
            make.width.equalTo(avatarImage!.snp.height);
        }
        
        titleLabel!.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImage!.snp.right).offset(10);
            make.right.equalTo(self.contentView);
            make.top.equalTo(10);
            make.height.equalTo(20);
        }
        
        rankLabel!.snp.makeConstraints { (make) in
            make.left.right.equalTo(titleLabel!);
            make.bottom.equalTo(-10);
            make.height.equalTo(20);
        }
        
    }
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
