//
//  JuiceMaker - FruitStore.swift
//
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    
    var stocks: [Fruit: Int] = [:]
    var stockStock: [Fruit: Int] = [:]

    init(defaultFruitStock: Int) {
        Fruit.allCases.forEach { stocks[$0] = defaultFruitStock }
    }

    func chooseRecipe(order: Juice) throws {
        for fruit in order.chooseJuice.keys {
            do {
                try checkFruitStock(juice: order, fruits: fruit)
            } catch StockError.outOfError {
                checkStockTest(juice: order, fruits: fruit)
                print("재고부족")
            }
        }
        // print(stocks)
    }

    private func checkFruitStock(juice: Juice, fruits: Fruit) throws {
        guard let stockFruit = stocks[fruits],
              let needFruitAmount = juice.chooseJuice[fruits],
              stockFruit >= needFruitAmount else {
            throw StockError.outOfError
        }
        makeJuice(juice: juice, fruits: fruits)
    }
    
    private func makeJuice(juice: Juice, fruits: Fruit) {
        if let stockFruit = stocks[fruits],
           let requiredFruit = juice.chooseJuice[fruits] {
            stocks.updateValue(stockFruit - requiredFruit, forKey: fruits)
        }
        print(stocks)
    }
    
    func checkStockTest(juice: Juice, fruits: Fruit) {
        
        if let stockFruit = stocks[fruits],
           let requiredFruit = juice.chooseJuice[fruits] {
            stockStock.updateValue(requiredFruit - stockFruit, forKey: fruits)
        }
        print(stockStock)
    }
}
