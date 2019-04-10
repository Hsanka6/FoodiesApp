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
    
    @IBOutlet var star: UIImageView!
    @IBOutlet var kolodaView: KolodaView!
    var filterType:String!
    var restaurants = [CDYelpBusiness]()
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
        print(filterType)
        print(restaurants.count)
        star.image = UIImage.yelpStars(numberOfStars: .two, forSize: .regular)
        
        //self.view.translatesAutoresizingMaskIntoConstraints = false
        //setUpCards()
        for bus in restaurants{
            print(bus.name)
        }
        
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
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
        //cheap eats(search by price),trendy eats, best rated,open now
       
    }
    
    func cheapEats(){
    }
    func openNowEats(){
    }
    
    func bestRatedEats(){
    }
    
    func trendyEats(){
        
    }

}

extension SwipeViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
//        let position = kolodaView.currentCardIndex
//        for _ in 1...4 {
//            dataSource.append(UIImage(named: "haas")!)
//        }
        //kolodaView.insertCardAtIndexRange(position..<position + 4, animated: true)
        //kolodaView.reloadData()
    }
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        UIApplication.shared.openURL(URL(string: "https://yalantis.com/")!)
        performSegue(withIdentifier: "moreDetail", sender: self)
    }
}
extension SwipeViewController: KolodaViewDataSource{

    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return 20
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
        customCardView.starsView.image = UIImage.yelpStars(numberOfStars: .two, forSize: .small)
        customCardView.ratingImage = UIImage.yelpStars(numberOfStars: .two, forSize: .small)
        return customCardView
    }

    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
}


