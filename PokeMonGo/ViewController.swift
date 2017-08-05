//
//  ViewController.swift
//  PokeMonGo
//
//  Created by JOHN KENNY on 05/08/2017.
//  Copyright © 2017 JOHN KENNY. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet var map: MKMapView!
    
    //
    var updeteMap = 0
    
    //used to manager the users location
    var manager = CLLocationManager()
    
    //pokemen
    var pokemen : [Pokemon] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.delegate = self
        
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
                    let annotation = PokeAnno(coor: cord, poke: self.pokemen[Int(arc4random_uniform(UInt32(self.pokemen.count)))])
        
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
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let view = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        
        
        if annotation is MKUserLocation{
            view.image = UIImage(named: "player")
        }else{
            let p = (annotation as! PokeAnno).pokemon
            view.image = UIImage(named: p.imageName!)
        }
        
        
        var frame = view.frame
        frame.size.height = 40
        frame.size.width = 40
        view.frame = frame
        
        
        return  view
    }


}

