//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Lucas Pacheco on 15/10/19.
//  Copyright © 2019 Lucas Pacheco. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate {

    //var meals = Array<Meal>()
    
    var meals = [Meal(name: "Eggplant brownie", happiness: 5), Meal(name: "Zucchini Muffin", happiness: 3)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
           
        var cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        return cell
    }
    
    func add(meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMeal") {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }


}
