//
//  GHCityViewController.swift
//  GitHub
//
//  Created by nachuan on 2016/10/24.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import UIKit



class GHCityViewController: GHViewController, UITableViewDataSource, UITableViewDelegate {

    var country: String!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI();
        // Do any additional setup after loading the view.
    }

    fileprivate func createUI() -> () {
        let tableView = GHTableView();
        tableView.frame = self.view.bounds;
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryDic[country]!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "Cell";
        var cell:GHTableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? GHTableViewCell;
        if cell == nil {
            cell = GHTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
        }
        cell!.textLabel?.text = countryDic[country]![indexPath.row];
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let notification: Notification = Notification.init(name: Notification.Name(rawValue: "selectCityResult"), object: nil, userInfo: ["city" : countryDic[country]![indexPath.row], "country" : country]);
        NotificationCenter.default.post(notification);
        
        
        self.navigationController!.popToRootViewController(animated: true);
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
