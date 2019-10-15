//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Lucas Pacheco on 15/10/19.
//  Copyright © 2019 Lucas Pacheco. All rights reserved.
//

class Meal {
    
    var name: String?
    var happiness: Int?
    var items = Array<Item>()
    
    init(name: String, happiness: Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories(calories: Array<Double>) -> Double {
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
}
