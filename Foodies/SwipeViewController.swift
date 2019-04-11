//
//  SwipeViewController.swift
//  Foodies
//
//  Created by Haasith Sanka on 3/30/19.
//  Copyright © 2019 Haasith Sanka. All rights reserved.
//

import UIKit
import Koloda
import CDYelpFusionKit
import Kingfisher

class SwipeViewController: UIViewController{
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var kolodaView: KolodaView!
    var filterType:String?
    var restaurants = [CDYelpBusiness]()
    var latitude:Double?
    var longitude:Double?
    
    var yelpAPIClient = CDYelpAPIClient(apiKey: "k5KiWZD_LBkDD0npV2vMPY8Hriq5MfWgHU2JtXlXMoM1qoYST2a8r8aIVEar9uCDCAwH8WH0t-J5ccwoD5J53iBGjwbA1ACSPdvvQvyC5sCOgUSXSYQnMY_bWi0wXHYx")

//    fileprivate var dataSource: [UIImage] = {
//        var array: [UIImage] = []
//        for index in 0..<4 {
//            array.append(UIImage(named: "haas")!)
//        }
//
//        return array
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("IN SWIPEVIEW CONTROLLER")
        //print(filterType)
        print(restaurants.count)
        indicator.isHidden = true

        
        kolodaView.dataSource = self
        kolodaView.delegate = self
       
        //cheap eats(search by price),trendy eats, best rated,open now
       
    }
    
    func cheapEats(){
        yelpAPIClient.searchBusinesses(byTerm: "",
                                       location: "",
                                       latitude: latitude ?? 32.7,
                                       longitude: longitude ?? 117.16,
                                       radius: 40000,
                                       categories: [.food],
                                       locale: .english_unitedStates,
                                       limit: 20,
                                       offset: 20,
                                       sortBy: .rating,
                                       priceTiers: [.oneDollarSign],
                                       openNow: nil,
                                       openAt: nil,
                                       attributes: [.deals]) { (response) in
                                        if let response = response,
                                            let businesses = response.businesses,
                                            businesses.count > 0 {
                                            for bus in businesses{
                                                self.restaurants.append(bus)
                                            }
                                            self.indicator.stopAnimating()
                                        }
                                        else{
                                            print("No more businesses found")
                                        }
        }
        
        
    }
    func openNowEats(){
    }
    
    func bestRatedEats(){
    }
    
    func trendyEats(){
        
    }
    @IBAction func swipeRight(_ sender: Any) {
        kolodaView.swipe(.right)
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        kolodaView.swipe(.left)
    }
    
    
}

extension SwipeViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        indicator.isHidden = false
        indicator.startAnimating()
        switch filterType {
        case "CheapEats":
            cheapEats()
            break
        case "OpenNowEats":
            openNowEats()
            break
        case "TrendyEats":
            trendyEats()
            break
        case "BestRatedEats":
            bestRatedEats()
            break
        default:
            bestRatedEats()
        }
    }
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        //UIApplication.shared.openURL(URL(string: "https://yalantis.com/")!)
        performSegue(withIdentifier: "moreDetail", sender: self)
    }
}
extension SwipeViewController: KolodaViewDataSource{

    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return restaurants.count
    }

    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }

    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let customCardView = CardView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
        self.view.addSubview(customCardView)
        //return UIImageView(image: dataSource[index])
        customCardView.imageView.kf.setImage(with: restaurants[index].imageUrl)
       // customCardView.ratingImage?.kf.setImage(with:restaurants[index].)
        
        let milesAway = restaurants[index].distance!/1609.344
        let strMiles = String(format: "%.1f", milesAway)
        customCardView.distanceAway.text = strMiles + " mi"
        customCardView.numRatings.text = "(" + String(describing: restaurants[index].reviewCount!) + ")"
        customCardView.label.text = restaurants[index].name
        customCardView.starsView.settings.fillMode = .half
        if let rat = restaurants[index].rating{
            customCardView.starsView.rating = rat
        }
        
        if let pri = restaurants[index].price {
            customCardView.priceLabel.text = getPrice(price: pri)
        }
        
        if let closed = restaurants[index].isClosed {
            if closed{
                customCardView.openNow.text = "CLOSED"
            }
            customCardView.openNow.text = "OPEN"
        }
        
        
        
        return customCardView
    }
    
    
    func getPrice(price:String) -> String{
        var p:String!
        switch price {
        case "$":
            p = "$1 - $10"
            break
        case "$$":
            p = "$11 - $30"
            break
        case "$$$":
            p = "$31 - $60"
            break
        case "$$$$":
            p = "$61+"
            break
        default:
            p = "N/A"
        }
        return p
    }
    
    

    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
}


