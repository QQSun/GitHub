//
//  GHUserDetailVC.swift
//  GitHub
//
//  Created by nachuan on 2016/10/24.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import UIKit

let kTableHeaderViewHeight: CGFloat = 132;
let kTitleLabelWidth = 100;


class GHUserDetailVC: GHViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: GHTableView!;
    var avatarImage: UIImageView!;
    var dateLabel: UILabel!;
    var titleLabel: UILabel!;
    var eMailLabel: UILabel!;
    var subTitleLabel: UILabel!;
    var weiboAddress: UILabel!;
    var httpLabel: UILabel!;//个人网址
    var repositoryBtn: UIButton!;
    var followBtn: UIButton!;
    var followerBtn: UIButton!;
    var slipLine: UIView!;
    var selectedBtn: UIButton!;//记录选中的按钮
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = GHTableView();
        tableView.frame = self.view.bounds;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableHeaderView = createTableHeaderView();
//        tableView.headerView(forSection: 1)?.backgroundColor = UIColor.black;
        self.view.addSubview(tableView);
        
        
    
    }

    
    /// 创建tableView的表头视图
    func createTableHeaderView() -> UIView {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kTableHeaderViewHeight));
        view.backgroundColor = UIColor.white;
        avatarImage = UIImageView();
        avatarImage.backgroundColor = UIColor.red;
        avatarImage.layer.cornerRadius = 5;
        avatarImage.layer.masksToBounds = true;
        view.addSubview(avatarImage);
        
        dateLabel = UILabel.createLabel("2013-03-13", font: nil, textColor: nil, textAlignment: nil);
        view.addSubview(dateLabel);

        titleLabel = UILabel.createLabel("GitHub", font: UIFont.boldSystemFont(ofSize: 14), textColor: kTitleColor, textAlignment: nil);
        view.addSubview(titleLabel);
        
        eMailLabel = UILabel.createLabel("www.qq.com", font: nil, textColor: kHttpColor, textAlignment: nil);
        view.addSubview(eMailLabel);
        
        subTitleLabel = UILabel.createLabel("github", font: nil, textColor: nil, textAlignment: nil);
        view.addSubview(subTitleLabel);
        
        weiboAddress = UILabel.createLabel("www.weibo.com", font: nil, textColor: kHttpColor, textAlignment: nil);
        view.addSubview(weiboAddress);
        
        httpLabel = UILabel.createLabel("www.person.com", font: nil, textColor: kHttpColor, textAlignment: nil);
        view.addSubview(httpLabel);
        
        repositoryBtn = createBtn("4\nRepository", tag: 10);
        repositoryBtn.isSelected = true;
        selectedBtn = repositoryBtn;
        view.addSubview(repositoryBtn);
        
        followBtn = createBtn("0\nFollowing", tag: 11);
        view.addSubview(followBtn);
        
        followerBtn = createBtn("333\nFollower", tag: 12);
        view.addSubview(followerBtn);
        
        slipLine = UIView();
        slipLine.backgroundColor = kMainColor;
        view.addSubview(slipLine);
        
        
        createConstraints();
        
        return view;
    }
    
    
    /// 创建约束.约束表头视图
    func createConstraints() -> () {
        avatarImage.snp.makeConstraints { (make) in
            make.left.top.equalTo(10);
            make.width.height.equalTo(50);
        };
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImage.snp.right).offset(10);
            make.top.equalTo(avatarImage);
            make.height.equalTo(20);
            make.width.equalTo(kTitleLabelWidth);
        };
        
        eMailLabel.snp.makeConstraints { (make) in
            make.top.height.equalTo(titleLabel);
            make.left.equalTo(titleLabel.snp.right).offset(10);
            make.right.equalTo(10);
        };
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(titleLabel);
            make.top.equalTo(titleLabel.snp.bottom);
        };
        weiboAddress.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(eMailLabel);
            make.top.equalTo(eMailLabel.snp.bottom);
        };
        
        dateLabel.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(subTitleLabel);
            make.top.equalTo(subTitleLabel.snp.bottom);
        };
        
        httpLabel.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(weiboAddress);
            make.top.equalTo(weiboAddress.snp.bottom);
        };
        
        
        repositoryBtn.snp.makeConstraints { (make) in
            make.left.equalTo(0);
            make.top.equalTo(httpLabel.snp.bottom).offset(10);
            make.right.equalTo(followBtn.snp.left);
            make.height.equalTo(40);
        };
        
        followBtn.snp.makeConstraints { (make) in
            make.top.height.equalTo(repositoryBtn);
            make.left.equalTo(repositoryBtn.snp.right);
            make.width.equalTo(repositoryBtn.snp.width);
        };
        
        followerBtn.snp.makeConstraints { (make) in
            make.top.height.equalTo(repositoryBtn);
            make.left.equalTo(followBtn.snp.right);
            make.right.equalTo(0);
            make.width.equalTo(repositoryBtn);
        };
        
        slipLine.snp.makeConstraints { (make) in
            make.left.right.width.equalTo(repositoryBtn);
            make.top.equalTo(repositoryBtn.snp.bottom).offset(10);
            make.height.equalTo(2);
        };
        
        
        
    }
    
    
    
    
    
   fileprivate func createBtn(_ title: String, tag: Int) -> UIButton {
        let btn = UIButton.init();
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14);
        btn.titleLabel?.numberOfLines = 2;
        btn.titleLabel?.textAlignment = NSTextAlignment.center;
        btn.adjustsImageWhenHighlighted = false;
        btn.setTitle(title, for: UIControlState.normal);
        btn.setTitleColor(kTitleColor, for: UIControlState.normal);
        btn.setTitleColor(kMainColor, for: UIControlState.selected);
        btn.addTarget(self, action: #selector(selectBtnClicked(_: )), for: UIControlEvents.touchUpInside);
        return btn;
    }
    
    
    //MARK: -tableViewDataSource
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1;
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "Cell";
        var cell: GHUserDetailCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? GHUserDetailCell;
        if cell == nil {
            cell = GHUserDetailCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
        }
        
        return cell!;
    }
    
    
    //MARK: - button
    
    func selectBtnClicked(_ sender: UIButton) -> () {
        
        if selectedBtn == sender {
            return;
        }
        var center = slipLine.center;
        center.x = sender.center.x;
        sender.isSelected = !sender.isSelected;
        selectedBtn.isSelected = !selectedBtn.isSelected;
        selectedBtn = sender;
        UIView.animate(withDuration: 0.15) { 
            self.slipLine.center = center;
        };
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
