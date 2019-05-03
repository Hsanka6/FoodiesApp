//
//  FavoritesViewController.swift
//  Foodies
//
//  Created by Haasith Sanka on 4/11/19.
//  Copyright © 2019 Haasith Sanka. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let kUserDefault = UserDefaults.standard
//
//        let data = kUserDefault.array(forKey: "favorites")! as? [String] ?? [String]()
//        print(data)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let kUserDefault = UserDefaults.standard
        
        let data = kUserDefault.array(forKey: "favorites")! as? [String] ?? [String]()
        print(data)

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
