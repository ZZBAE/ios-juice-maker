//
//  JuiceMaker - JuiceMaker.swift
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore(defaultFruitStock: 2)
    
    func orderFruitJuice(of juice: Juice){
        do {
            try fruitStore.chooseRecipe(order: juice)
        } catch {
            print(error)
        }
    }
}
