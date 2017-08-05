//
//  PokemonAnno.swift
//  PokeMonGo
//
//  Created by JOHN KENNY on 05/08/2017.
//  Copyright © 2017 JOHN KENNY. All rights reserved.
//

import UIKit
import MapKit

class PokeAnno : NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    var pokemon : Pokemon
    
    init(coor: CLLocationCoordinate2D, poke: Pokemon) {
        self.coordinate = coor
        self.pokemon = poke
    }
}
