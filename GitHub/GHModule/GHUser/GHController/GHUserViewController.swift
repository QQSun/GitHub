//
//  GHUserViewController.swift
//  GitHub
//
//  Created by nachuan on 2016/10/20.
//  Copyright © 2016年 nachuan. All rights reserved.
//
import UIKit

//public extension UIBarButtonItem {
//    public class func createBarButtonItem(title: String?, imageNamed: String?, target: AnyObject?, action: Selector, for controlEvents: UIControlEvents) -> UIBarButtonItem {
//        let btn = UIButton.init();
//        btn.setTitle(title, for: UIControlState.normal);
//        if imageNamed != nil {
//            btn.setImage(UIImage.init(named: imageNamed!), for: UIControlState.normal);
//            btn.setImage(UIImage.init(named: imageNamed! + "_highlighted"), for: UIControlState.selected);
//        }
//        btn.adjustsImageWhenHighlighted = false;
//        btn.addTarget(target, action: action, for: controlEvents);
//        btn.sizeToFit();
//        let item = UIBarButtonItem.init(customView: btn);
//        return item;
//    }
//}

class GHUserViewController: GHViewController, UITableViewDataSource, UITableViewDelegate {

    

    

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
        self.view.backgroundColor = UIColor.red;
        var tableView: GHTableView;
        tableView = GHTableView.init(frame: self.view.bounds, style: UITableViewStyle.plain);
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
        
        
    }

    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell";
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier);
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
            cell!.textLabel!.text = "Swift";
        }
        return cell!;
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30;
    }
    
    func cityItemClicked(_ sender: UIButton) -> () {
        NSLog("city");
    }
    
    func languageItemClicked(_ sender: UIButton) -> () {
        NSLog("language");
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




//extension GHUserViewController: UITableViewDataSource, UITableViewDelegate {
//    
//}
