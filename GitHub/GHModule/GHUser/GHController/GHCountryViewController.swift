//
//  GHCountryViewController.swift
//  GitHub
//
//  Created by nachuan on 2016/10/24.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import UIKit

class GHCountryViewController: GHViewController,UITableViewDelegate, UITableViewDataSource {

    
    var countryArray: [String]!;
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationItem.title = "国家"
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI();
        // Do any additional setup after loading the view.
    }

    private func createUI() -> () {
        
        
        countryArray = Array(countryDic.keys);
        let index = countryArray.index(of: "Other")!;
        countryArray.remove(at: index);
        countryArray = countryArray.sorted(by: < );
        countryArray.append("Other");
        
    let tableView = GHTableView();
        tableView.frame = self.view.bounds;
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "Cell";
        var cell:GHTableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? GHTableViewCell;
        if cell == nil {
            cell = GHTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
        }
        cell!.textLabel?.text = countryArray[indexPath.row];
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = GHCityViewController();
        city.country = countryArray[indexPath.row];
        self.navigationController?.pushViewController(city, animated: true);
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
