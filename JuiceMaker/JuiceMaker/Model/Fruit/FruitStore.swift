//
//  JuiceMaker - FruitStore.swift
//
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    static let shared = FruitStore()
    var stocks: [Fruit: Int] = [:]
    var insufficientStock: [Fruit: Int] = [:]
    
    private init() {
        Fruit.allCases.forEach { stocks[$0] = 10 }
    }
    
    func checkFruitStock(fruit: Fruit, amount: Int) throws {
        guard let stockFruit = stocks[fruit] else { throw StockError.unknown }
        guard stockFruit >= amount else {
            return insufficientStock[fruit] = amount - stockFruit
        }
    }
    
    func useStock(juice: Juice) {
        for (fruit, fruitAmount) in juice.recipe {
            if let stockFruit = stocks[fruit] {
                stocks.updateValue(stockFruit - fruitAmount, forKey: fruit)
            }
        }
    }
}

