//
//  GHTabBarController.swift
//  GitHub
//
//  Created by nachuan on 2016/10/20.
//  Copyright © 2016年 nachuan. All rights reserved.
//

import UIKit

class GHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let _ = addChildController("GHUserViewController", title: "用户", imageNamed: "github60", tag: 0);
        let _ = addChildController("GHRepositoryViewController", title: "仓库", imageNamed: "github60", tag: 1);
        let _ = addChildController("GHDiscoveryViewController", title: "发现", imageNamed: "github60", tag: 2);
        let _ = addChildController("GHPersonalViewController", title: "我的", imageNamed: "github60", tag: 3);
        
        
        
        
        
    }

    func addChildController(_ controllerNamed: String, title: String, imageNamed: String, tag: Int) -> GHViewController? {
        let Controller = NSClassFromString("GitHub." + controllerNamed) as? GHViewController.Type;
        if Controller != nil {
            let controller: GHViewController = Controller!.init();
            controller.title = title;
            if title == "用户" {
                controller.navigationItem.title = "all languages";
            }
            controller.tabBarItem.image = UIImage(named: imageNamed);
            let nav = GHNavigationController(rootViewController: controller);
            addChildViewController(nav);
            return controller;
        }
        return nil;
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
