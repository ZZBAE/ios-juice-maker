//
//  Fruit.swift
//  testjuice
//
//  Created by 허건 on 2022/04/26.
//
enum Fruit: String, CaseIterable {
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case mango = "망고"
    case pineapple = "파인애플"

    var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .mango:
            return "망고"
        case .pineapple:
            return "파인애플"
        }
    }
}
