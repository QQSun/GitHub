//
//  GHUserViewController.swift
//  GitHub
//
//  Created by nachuan on 2016/10/20.
//  Copyright © 2016年 nachuan. All rights reserved.
//
import UIKit
import SnapKit

private let kToolbarHeight: CGFloat = 40;
private let kListHeight = kScreenHeight - kToolbarHeight - kNavigationBarHeight;




class GHUserViewController: GHViewController, UITableViewDataSource, UITableViewDelegate, GHLanguageViewControllerDelegate {

    
    
    var line = UIView();
    var selectedBtn: UIButton?;
    var cityBtn: UIButton?;
    var countryBtn: UIButton?;
    var cityTableView: GHTableView?;
    var countryTableView: GHTableView?;
    
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        let cityItem = UIBarButtonItem.createBarButtonItem(_: "城市", imageNamed: nil, target: self, action:#selector(cityItemClicked(_: )), for: UIControlEvents.touchUpInside);
        self.navigationItem.leftBarButtonItem = cityItem;
        
        let languageItem = UIBarButtonItem.createBarButtonItem(_: "语言", imageNamed: nil, target: self
            , action: #selector(languageItemClicked(_: )), for: UIControlEvents.touchUpInside);
        self.navigationItem.rightBarButtonItem = languageItem;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSelectToolbar();
        createListView();

        NotificationCenter.default.addObserver(self, selector: #selector(selectCityResult(notification:)), name: NSNotification.Name(rawValue: "selectCityResult"), object: nil);
        
    }

    func createSelectToolbar() -> () {
        let view = UIView();
        self.view.addSubview(view);
//        view.backgroundColor = UIColor.red;
        
        
        cityBtn = createBtn(title: "beijing", view: view, target: self, action: #selector(selectToolbarBtnClicked(sender:)), for: UIControlEvents.touchUpInside, tag: 10);
        cityBtn!.isSelected = true;
        selectedBtn = cityBtn;
        countryBtn = createBtn(title: "China", view: view, target: self, action: #selector(selectToolbarBtnClicked(sender:)), for: UIControlEvents.touchUpInside, tag: 11);
        
        line.backgroundColor = kMainColor;
        
        view.addSubview(line);
        line.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(cityBtn!);
            make.height.equalTo(2);
        }

        view.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self.view);
            make.height.equalTo(kToolbarHeight);
        }
        
        cityBtn!.snp.makeConstraints { (make) in
            make.top.left.height.equalTo(view);
            make.right.equalTo(countryBtn!.snp.left);
        }
        countryBtn!.snp.makeConstraints { (make) in
            make.top.right.height.equalTo(view);
            make.left.equalTo(cityBtn!.snp.right);
            make.width.equalTo(cityBtn!);
        }
    }
    
    func createListView() -> () {
        let bgScrollView = UIScrollView();
        bgScrollView.isPagingEnabled = true;
        bgScrollView.contentSize = CGSize(width: kScreenWidth * 2, height: kListHeight);
        bgScrollView.frame = CGRect(x: 0, y: kToolbarHeight, width: kScreenWidth, height: kListHeight);
        self.view.addSubview(bgScrollView);
        
        
        cityTableView = GHTableView.init(frame: bgScrollView.bounds, style: UITableViewStyle.plain);
        cityTableView!.delegate = self;
        cityTableView!.dataSource = self;
        bgScrollView.addSubview(cityTableView!);
        
        
        countryTableView = GHTableView.init(frame: CGRect(x: kScreenWidth, y: 0, width: kScreenWidth, height: kListHeight), style: UITableViewStyle.plain);
        countryTableView!.delegate = self;
        countryTableView!.dataSource = self;
        bgScrollView.addSubview(countryTableView!);
        
    }
    
    func createBtn(title: String, view: UIView, target: Any?, action: Selector, for controEvent: UIControlEvents, tag: Int) -> UIButton {
        let cityBtn = UIButton();
        cityBtn.tag = tag;
        cityBtn.adjustsImageWhenHighlighted = false;
        cityBtn.setTitle(title, for: UIControlState.normal);
        cityBtn.setTitleColor(UIColor.gray, for: UIControlState.normal);
        cityBtn.setTitleColor(kMainColor, for: UIControlState.selected);
        cityBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12);
        cityBtn.addTarget(target, action: action, for: controEvent);
        view.addSubview(cityBtn);
        return cityBtn;
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell";
        var cell: GHUserCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? GHUserCell;
        if cell == nil {
            cell = GHUserCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
//            cell!.textLabel!.text = "Swift";
        }
        return cell!;
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = GHUserDetailVC();
        self.navigationController?.pushViewController(detail, animated: true);
        
    }
    
    //MARK: - button
    
    func cityItemClicked(_ sender: UIButton) -> () {
        NSLog("city");
        let country = GHCountryViewController();
        self.navigationController?.pushViewController(country, animated: true);
        
    }
    
    func languageItemClicked(_ sender: UIButton) -> () {
        NSLog("language");
        let language = GHLanguageViewController();
        language.languageEntranceType = GHLanguageEntranceType.forUser;
        language.delegate = self;
        self.navigationController?.pushViewController(language, animated: true);
        
    }
    
    func selectToolbarBtnClicked(sender: UIButton) -> () {
        print("toolbar");
        
        if sender == selectedBtn {
            return;
        }
        sender.isSelected = !sender.isSelected;
        selectedBtn!.isSelected = !selectedBtn!.isSelected;
        selectedBtn = sender;
        UIView.animate(withDuration: 0.25) {
            self.line.frame = CGRect.init(x: (CGFloat(sender.tag - 10)) * kScreenWidth_2, y: kToolbarHeight - 2, width: kScreenWidth_2, height: 2);
        };
    }
    
    func selectCityResult(notification: Notification) -> () {
        print(notification.userInfo);
        let cityDic: Dictionary = notification.userInfo!;
        
        cityBtn!.setTitle(cityDic["city"] as? String, for: UIControlState.normal);
        countryBtn!.setTitle(cityDic["country"] as? String, for: UIControlState.normal);
    }
    
    //MARK: - 语言选择类代理
    func selectLanguage(_ language: String?) {
        if language != nil {
            self.navigationItem.title = language;
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    deinit {
        NotificationCenter.default.removeObserver(self);
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




//extension GHUserViewController: UITableViewDataSource, UITableViewDelegate {
//    
//}
