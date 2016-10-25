//
//  GHRepositoryViewController.swift
//  GitHub
//
//  Created by nachuan on 2016/10/20.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import UIKit

class GHRepositoryViewController: GHViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView: GHTableView = GHTableView();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow;
        createUI();
        
    
    }

    func createUI() -> () {
        tableView.frame = self.view.bounds;
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "Cell";
        var cell: GHRepositoryCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? GHRepositoryCell;
        if cell == nil {
            cell = GHRepositoryCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
        }
//        cell!.textLabel?.text = "repository";
        return cell!;
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
