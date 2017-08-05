//
//  CoreDataHelper.swift
//  PokeMonGo
//
//  Created by JOHN KENNY on 05/08/2017.
//  Copyright © 2017 JOHN KENNY. All rights reserved.
//

import UIKit
import CoreData

func createPoke(){
    let ctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let pokemon = Pokemon(context: ctx)
    pokemon.name = "Mew"
    pokemon.imageName

    
}
