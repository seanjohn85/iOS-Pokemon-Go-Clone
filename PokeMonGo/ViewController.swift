//
//  ViewController.swift
//  PokeMonGo
//
//  Created by JOHN KENNY on 05/08/2017.
//  Copyright © 2017 JOHN KENNY. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet var map: MKMapView!
    
    //
    var updeteMap = 0
    
    //used to manager the users location
    var manager = CLLocationManager()
    
    //pokemen
    var pokemen : [Pokemon] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get pokemon from core dataa nd store into array
        pokemen = getAllPoke()
        //set up manager
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            //shows the users location
            map.showsUserLocation = true
            //update the manager with the users location
            manager.startUpdatingLocation()
            //set a timer intervel to run every 5 seconds
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
                //span pokemon
                if let cord = self.manager.location?.coordinate{
                    //add anotation to the map
                    let annotation = MKPointAnnotation()
                    
                    annotation.coordinate = cord
                    annotation.coordinate.latitude += (Double(arc4random_uniform(200)) - 100.0) / 40000.0
                    annotation.coordinate.longitude += (Double(arc4random_uniform(200)) - 100.0) / 40000.0
                    //add the annotation to the map
                    self.map.addAnnotation(annotation)
                }
                
            })
        }else{
            //request user permission
            manager.requestWhenInUseAuthorization()
        }
 
    }

    //update location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("did update")
        if updeteMap < 5 {
            //set the amount of map to display
            let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 300, 300)
            //set the region
            map.setRegion(region, animated: false)
            
            updeteMap += 1
        }else{
            manager.stopUpdatingLocation()
        }
        
    }
    
    
    
    //compass button action to repostion map in users location
    
    @IBAction func compassBtn(_ sender: Any){
        //ensure coordinate excists to avoid errors
        if let cord = manager.location?.coordinate{
            //set the amount of map to display
            let region = MKCoordinateRegionMakeWithDistance(cord, 300, 300)
            //set the region
            map.setRegion(region, animated: true)
        }
        
    }


}

