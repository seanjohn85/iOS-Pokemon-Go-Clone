//
//  CoreDataHelper.swift
//  PokeMonGo
//
//  Created by JOHN KENNY on 05/08/2017.
//  Copyright © 2017 JOHN KENNY. All rights reserved.
//

import UIKit
import CoreData

func addallPoke(){
    
    create(name: "mew")
    create(name: "snorlax")
    create(name: "pidgey")
    create(name: "pikachu-2")
    create(name: "charmander")
    create(name: "caterpie")
    create(name: "meowth")
    create(name: "dratini")
    create(name: "psyduck")
    create(name: "rattata")
    create(name: "mankey")
    create(name: "zubat")
    create(name: "squirtle")
    create(name: "abra")
    create(name: "weedle")
    create(name: "venonat")
    create(name: "bullbasaur")
    create(name: "eevee")
    create(name: "bellsprout")
    
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
}

func create(name : String){
    let ctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let pokemon = Pokemon(context: ctx)
    pokemon.name = name.capitalized
    pokemon.imageName = name

}

//get all pokemon from core data

func getAllPoke() -> [Pokemon]{
    
    let ctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do {
        let p = try ctx.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        //on first run add all pokemon
        if p.count == 0 {
            addallPoke()
            return getAllPoke()
        }
        return p
    }catch{
        
    }
    return []
}


//all cot
func getAll(cot : Bool) -> [Pokemon]{
    let ctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fetch = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    fetch.predicate = NSPredicate(format: "cot == %@", cot as CVarArg)
    do {
        let p = try ctx.fetch(fetch) as [Pokemon]
        
        return p
    }catch{
        
    }
    return []
}

