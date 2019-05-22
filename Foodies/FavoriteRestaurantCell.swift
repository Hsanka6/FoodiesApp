//
//  FavoriteRestaurantCell.swift
//  Foodies
//
//  Created by Haasith Sanka on 5/21/19.
//  Copyright © 2019 Haasith Sanka. All rights reserved.
//

import UIKit
import Cosmos
import CDYelpFusionKit
import Kingfisher

class FavoriteRestaurantCell: UITableViewCell {

    @IBOutlet var restaurantImage: UIImageView!
    @IBOutlet var restaurantLabel: UILabel!
    @IBOutlet var starsView: CosmosView!
    @IBAction func goButton(_ sender: Any) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(business: CDYelpBusiness){
        restaurantImage.kf.setImage(with: business.imageUrl)
        restaurantLabel.text = business.name
        starsView.settings.fillMode = .half
        if let rat = business.rating{
            starsView.rating = rat
        }
    }

}
