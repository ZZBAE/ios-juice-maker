//
//  JuiceMaker - JuiceMaker.swift
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore(defaultFruitStock: 10)
    
    func makeJuice(of juice: Juice) throws {
        try chooseRecipe(order: juice)
    }
    
    func chooseRecipe(order: Juice) throws {
        for (fruit, fruitAmount) in order.recipeOfJuice {
            try checkFruitStock(fruit: fruit, amount: fruitAmount)
        }
        useStock(juice: order)
    }

    private func checkFruitStock(fruit: Fruit, amount: Int) throws {
        guard let stockFruit = fruitStore.stocks[fruit],
              stockFruit >= amount else {
            throw StockError.outOfStock
        }
    }
    
    private func useStock(juice: Juice) {
        for (fruit, fruitAmount) in juice.recipeOfJuice {
            if let stockFruit = fruitStore.stocks[fruit] {
                fruitStore.stocks.updateValue(stockFruit - fruitAmount, forKey: fruit)
            }
        }
    }
}
