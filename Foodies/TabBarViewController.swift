//
//  TabBarViewController.swift
//  Foodies
//
//  Created by Haasith Sanka on 5/3/19.
//  Copyright © 2019 Haasith Sanka. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    
    var savedRestaurants = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //need to access index 1 since vc's are stored in tabbarcontroller starting with 0, so 1 to access 2nd vc.
//        if (tabBarViewControllers.indices.contains(1)) {
//            if let vc2 = tabBarViewControllers[1] as? VC2Class {
//                vc2.stringIWantToSet = stringToSet
//            }
//        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
