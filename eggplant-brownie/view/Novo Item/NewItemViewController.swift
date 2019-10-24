//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Lucas Pacheco on 23/10/19.
//  Copyright © 2019 Lucas Pacheco. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var caloriesField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func addNewItem(_ sender: Any) {
        
        guard let name = nameField!.text else {
            return
        }
       
        guard let calories = Double(caloriesField!.text!) else {
            return
        }
        
        let item = Item(name: name, calories: calories)
        
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
