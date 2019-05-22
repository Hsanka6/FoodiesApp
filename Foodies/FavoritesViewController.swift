//
//  FavoritesViewController.swift
//  Foodies
//
//  Created by Haasith Sanka on 4/11/19.
//  Copyright © 2019 Haasith Sanka. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var favoritesId = [String]()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
//        let kUserDefault = UserDefaults.standard
//
//        let data = kUserDefault.array(forKey: "favorites")! as? [String] ?? [String]()
//        print(data)

        // Do any additional setup after loading the view.
    }
    
    func setUpTable(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let kUserDefault = UserDefaults.standard
        
        let data = kUserDefault.array(forKey: "favorites")! as? [String] ?? [String]()
        favoritesId = data
        tableView.reloadData()
        print(data)

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesId.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell" ) as? FavoriteRestaurantCell else{
            return UITableViewCell()
        }
        //cell.setupCell(business: fa)
        return cell
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
