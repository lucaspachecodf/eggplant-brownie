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

class ViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var happinessField: UITextField!
    
    var delegate: AddMealDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
}

