//
//  ViewController.swift
//  Foodies
//
//  Created by Haasith Sanka on 3/24/19.
//  Copyright © 2019 Haasith Sanka. All rights reserved.
//

import UIKit
import CDYelpFusionKit
import CoreLocation
import Kingfisher

class ViewController: UIViewController, CLLocationManagerDelegate{//, PoiViewDataSource, PoiViewDelegate {
//    func poi(_ poi: PoiView, runOutOfCardAt : Int, in direction: SwipeDirection) {
//        switch direction {
//        case .left:
//            print("left")
//        case .right:
//            print("right")
//        }
//    }

//
//
//    func poi(_ poi: PoiView, viewForCardAt index: Int) -> UIView{
//        return UIImageView(image: UIImage(named: "haas"))
//    }
    
    var lat:Double?
    var lon:Double?
    //var cards = [CardView]()
    var businesses = [CDYelpBusiness]()
    var locationManager: CLLocationManager!
    var yelpAPIClient = CDYelpAPIClient(apiKey: "k5KiWZD_LBkDD0npV2vMPY8Hriq5MfWgHU2JtXlXMoM1qoYST2a8r8aIVEar9uCDCAwH8WH0t-J5ccwoD5J53iBGjwbA1ACSPdvvQvyC5sCOgUSXSYQnMY_bWi0wXHYx")

    var filterType:String?
    @IBAction func cheapEats(_ sender: Any) {
        filterType = "CheapEats"
        locationManager.stopUpdatingLocation()
        guard let longitude = self.lon else {
            print("Trouble finding your location")
            return
        }
        guard let latitude = self.lat else {
            print("Trouble finding your location")
            return
        }
        let myGroup = DispatchGroup()
        myGroup.enter()
        yelpAPIClient.searchBusinesses(byTerm: "",
                                       location: "",
                                       latitude: latitude,
                                       longitude: longitude,
                                       radius: 40000,
                                       categories: [.food, .restaurants, .fastFood],
                                       locale: .english_unitedStates,
                                       limit: 50,
                                       offset: 0,
                                       sortBy: .distance,
                                       priceTiers: [.oneDollarSign],
                                       openNow: nil,
                                       openAt: nil,
                                       attributes: nil) { (response) in
                                        if let response = response,
                                            let businesses = response.businesses,
                                            businesses.count > 0 {
                                            self.businesses = response.businesses ?? []
                                             myGroup.leave()
                                         
                                        }
                }
        
        myGroup.notify(queue: .main) {
            print("Finished all requests. \(self.businesses.count)")
            self.performSegue(withIdentifier: "swipe", sender: self)
            //self.setUpCards()
        }
        
        
    }
    
    func setUpCards(){
//        for r in self.businesses{
//            let card = CardView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//            print(r.imageUrl!)
//            if let url = r.imageUrl{
//                card.imageView.kf.setImage(with: url)
//            }
//            card.label.text = r.name
//            cards.append(card)
//        }
//        if cards.count == 20{
//        self.performSegue(withIdentifier: "swipe", sender: self)
//        }
//        else{
//            print("HERE")
//        }
    }
    
    @IBAction func trendyEats(_ sender: Any) {
        filterType = "TrendyEats"
        locationManager.stopUpdatingLocation()
        guard let longitude = self.lon else {
            print("Trouble finding your location")
            return
        }
        guard let latitude = self.lat else {
            print("Trouble finding your location")
            return
        }
        let myGroup = DispatchGroup()
        myGroup.enter()
        yelpAPIClient.searchBusinesses(byTerm: "",
                                       location: "",
                                       latitude: latitude,
                                       longitude: longitude,
                                       radius: 40000,
                                       categories: [.food, .restaurants, .fastFood],
                                       locale: .english_unitedStates,
                                       limit: 50,
                                       offset: 0,
                                       sortBy: .rating,
                                       priceTiers: [.oneDollarSign, .twoDollarSigns, .threeDollarSigns,.fourDollarSigns],
                                       openNow: nil,
                                       openAt: nil,
                                       attributes: [.hotAndNew]) { (response) in
                                        if let response = response,
                                            let businesses = response.businesses,
                                            businesses.count > 0 {
                                            self.businesses = response.businesses ?? []
                                            myGroup.leave()
                                            
                                        }
        }
        
        myGroup.notify(queue: .main) {
            print("Finished all requests. \(self.businesses.count)")
            self.performSegue(withIdentifier: "swipe", sender: self)
            //self.setUpCards()
        }
    }
    
    @IBAction func openNowEats(_ sender: Any) {
        filterType = "OpenNowEats"
        locationManager.stopUpdatingLocation()
        guard let longitude = self.lon else {
            print("Trouble finding your location")
            return
        }
        guard let latitude = self.lat else {
            print("Trouble finding your location")
            return
        }
        let myGroup = DispatchGroup()
        myGroup.enter()
        yelpAPIClient.searchBusinesses(byTerm: "",
                                       location: "",
                                       latitude: latitude,
                                       longitude: longitude,
                                       radius: 40000,
                                       categories: [.food, .restaurants, .fastFood],
                                       locale: .english_unitedStates,
                                       limit: 50,
                                       offset: 0,
                                       sortBy: .distance,
                                       priceTiers: [.oneDollarSign, .twoDollarSigns, .threeDollarSigns,.fourDollarSigns],
                                       openNow: nil,
                                       openAt: nil,
                                       attributes: nil) { (response) in
                                        if let response = response,
                                            let businesses = response.businesses,
                                            businesses.count > 0 {
                                            self.businesses = response.businesses ?? []
                                            myGroup.leave()
                                            
                                        }
        }
        
        myGroup.notify(queue: .main) {
            print("Finished all requests. \(self.businesses.count)")
            self.performSegue(withIdentifier: "swipe", sender: self)
            //self.setUpCards()
        }
    }
    @IBAction func bestRatedEats(_ sender: Any) {
        filterType = "bestRatedEats"
        locationManager.stopUpdatingLocation()
        guard let longitude = self.lon else {
            print("Trouble finding your location")
            return
        }
        guard let latitude = self.lat else {
            print("Trouble finding your location")
            return
        }
        let myGroup = DispatchGroup()
        myGroup.enter()
        yelpAPIClient.searchBusinesses(byTerm: "",
                                       location: "",
                                       latitude: latitude,
                                       longitude: longitude,
                                       radius: 40000,
                                       categories: [.food, .restaurants, .fastFood],
                                       locale: .english_unitedStates,
                                       limit: 50,
                                       offset: 0,
                                       sortBy: .rating,
                                       priceTiers: [.oneDollarSign, .twoDollarSigns, .threeDollarSigns,.fourDollarSigns],
                                       openNow: nil,
                                       openAt: nil,
                                       attributes: nil) { (response) in
                                        if let response = response,
                                            let businesses = response.businesses,
                                            businesses.count > 0 {
                                            
                                            self.businesses = response.businesses ?? []
                                            myGroup.leave()
                                            
                                        }
        }
        
        myGroup.notify(queue: .main) {
            print("Finished all requests. \(self.businesses.count)")
            self.performSegue(withIdentifier: "swipe", sender: self)
            //self.setUpCards()
        }
    }
    
    var sampleCards = [UIView]()
   // var poiView = PoiView()
    var v = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
   
    
    
    @IBAction func expander(_ sender: Any) {
//        UIView.animate(withDuration: 5) {
//            self.v.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
//        }
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        
        UIView.animate(withDuration: 5) {
            self.v.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpPoi()
        print("IN VIEW CONTROLLER")
        locationSetup()
        let kUserDefault = UserDefaults.standard
        let arr = [String]()
        kUserDefault.set(arr, forKey: "favorites")
        kUserDefault.synchronize()
        
        navigationItem.hidesBackButton = true
        
        navigationController?.navigationBar.isUserInteractionEnabled = false


//        poiView.dataSource = self
//        poiView.delegate = self
    }
    
    
    
    func locationSetup(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
//    func setUpPoi(){
//        let viewWidth = self.view.frame.width
//        let viewHeight = self.view.frame.height
//
//        poiView.frame = CGRect(x: 0, y: 0, width: viewWidth - 200, height: viewHeight-200)
//
//        v.backgroundColor = UIColor.blue
//        var colors = [UIColor.red, UIColor.orange]
//        for i in (0..<2) {
//            let myView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//
//
//            //UIView(frame: CGRect(x: 0, y: 0, width: 240, height: 128))
//            sampleCards.append(myView)
//            sampleCards[i].backgroundColor = colors[i]
//        }
//        self.view.addSubview(poiView)
//
//        self.view.addSubview(v)
//
//    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "swipe"
        {
            if let swipeController = segue.destination as? SwipeViewController{
                print("in prepare \(self.businesses.count)")
                swipeController.filterType = self.filterType
                swipeController.restaurants = self.businesses
                swipeController.latitude = self.lat
                swipeController.longitude = self.lon
                //swipeController.cards = self.cards
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locValue:CLLocationCoordinate2D = manager.location?.coordinate{
            self.lat = locValue.latitude
            self.lon = locValue.longitude
            print("lat is \(locValue.latitude) and lon is \(locValue.longitude)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Location Error \(error)")
    }
    



}

