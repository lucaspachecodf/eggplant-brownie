//
//  Item.swift
//  eggplant-brownie
//
//  Created by Lucas Pacheco on 15/10/19.
//  Copyright © 2019 Lucas Pacheco. All rights reserved.
//

class Item : Equatable {
    
    var name:String
    var calories:Double
    
    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
}

func == (first: Item, second: Item) -> Bool {
    return first.name == second.name && first.calories == second.calories
}
