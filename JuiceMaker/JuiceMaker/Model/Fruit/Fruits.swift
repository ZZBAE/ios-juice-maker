//
//  Fruit.swift
//  testjuice
//
//  Created by 허건 on 2022/04/26.
//
enum Fruit: String, CaseIterable {
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    
    static func pulloriginAmount(amount: Int = 10) -> [Fruit : Int] {
        var fruits: [Fruit : Int] = [:]
        
        allCases.forEach { fruit in
            fruits[fruit] = amount
        }
        
        return fruits
    }
}
