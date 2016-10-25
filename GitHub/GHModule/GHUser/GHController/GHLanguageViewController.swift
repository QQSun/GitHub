//
//  GHLanguageViewController.swift
//  GitHub
//
//  Created by nachuan on 2016/10/25.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import UIKit

enum GHLanguageEntranceType {
    case forRepository
    case forUser
    case forTrending
}

protocol GHLanguageViewControllerDelegate : class {
    func selectLanguage(_ language: String?) -> ();
}

class GHLanguageViewController: GHViewController, UITableViewDelegate, UITableViewDataSource {

    var languageEntranceType: GHLanguageEntranceType = GHLanguageEntranceType.forUser;
    weak var delegate: GHLanguageViewControllerDelegate?
    var languageArray: [String]? {
        get {
            if languageEntranceType == .forUser {
                return [NSLocalizedString("all languages", comment: ""),"JavaScript","Java","PHP","Ruby","Python","CSS","CPP","C","Objective-C","Swift","Shell","R","Perl","Lua","HTML","Scala","Go"];
            }else if languageEntranceType == .forRepository {
                return ["JavaScript","Java","PHP","Ruby","Python","CSS","CPP","C","Objective-C","Swift","Shell","R","Perl","Lua","HTML","Scala","Go"];
            }else if languageEntranceType == .forTrending {
                return [NSLocalizedString("all languages", comment: ""),"javascript","java","php","ruby","python","css","cpp","c","objective-c","swift","shell","r","perl","lua","html","scala","go"];
            }else {
                return nil;
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI();
        // Do any additional setup after loading the view.
    }
    
    func createUI() -> () {
        let tableView = GHTableView();
        tableView.frame = self.view.bounds;
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if languageArray == nil {
            return 0;
        }else{
            return languageArray!.count;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "Cell";
        var cell: GHTableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? GHTableViewCell;
        if cell == nil {
            cell = GHTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
        }
        cell?.textLabel!.text = languageArray?[indexPath.row];
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if delegate != nil {
            delegate?.selectLanguage(languageArray?[indexPath.row]);
        }
        self.navigationController!.popViewController(animated: true);
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
