//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Lucas Pacheco on 15/10/19.
//  Copyright © 2019 Lucas Pacheco. All rights reserved.
//

import UIKit

protocol AddMealDelegate {
    func add(meal: Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    @IBOutlet var nameField: UITextField!
    @IBOutlet var happinessField: UITextField!
    
    var items=[Item(name:"EggplantBrownie",calories:10),
               Item(name:"ZucchiniMuffin",calories:10),
               Item(name:"Cookie",calories:10),
               Item(name:"Coconutoil",calories:500),
               Item(name:"Chocolatefrosting",calories:1000),
               Item(name:"Chocolatechip",calories:1000)
    ]
    
    var delegate: AddMealDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItemButton = UIBarButtonItem(title: "new item", style: .plain, target: self, action: #selector(showNewItem))
               
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    @objc func showNewItem() {
        let newItem = NewItemViewController()
        
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        }
    }
    
    @IBAction func add(_ sender: Any) {
        
        if nameField == nil || happinessField == nil {
            return
        }
        
        let name = nameField.text!
        let happiness = Int(happinessField.text!)
        
        if happiness == nil {
            return
        }
        
        let meal = Meal(name: name, happiness: happiness!)
        print("eaten:\(meal.name)\(meal.happiness)")
        
        if delegate == nil {
            return
        }
        
        delegate!.add(meal: meal)
        
        if let navigation = self.navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        var cell = UITableViewCell(style: UITableViewCell.CellStyle.default,reuseIdentifier:nil)
        cell.textLabel?.text=item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return items.count
    }
    
     var selected = Array<Item>()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        if (cell.accessoryType == UITableViewCell.AccessoryType.none) {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            selected.append(items[indexPath.row])
        }
        else {
            cell.accessoryType = UITableViewCell.AccessoryType.none
            
            if let position = selected.firstIndex(of: items[indexPath.row]) {
                selected.remove(at: position)
            }
        }
    }
}

