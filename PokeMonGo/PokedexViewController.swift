//
//  PokedexViewController.swift
//  PokeMonGo
//
//  Created by JOHN KENNY on 05/08/2017.
//  Copyright © 2017 JOHN KENNY. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    var cot : [Pokemon] = []
    var uncot : [Pokemon] = []

    //back to map screen
    @IBAction func mapBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cot = getAll(cot : true)
        uncot = getAll(cot : false)
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let poke : Pokemon
        if indexPath.section == 0{
            poke = cot[indexPath.row]
            
        }else{
            poke = uncot[indexPath.row]
            
        }
        let cell = UITableViewCell()
        cell.textLabel?.text = poke.name
        cell.imageView?.image = UIImage(named: poke.imageName!)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return cot.count
        }else{
            return uncot.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "CAUGHT"
        }else{
            return "NEED TO CATCH !!"
        }
    }

}
