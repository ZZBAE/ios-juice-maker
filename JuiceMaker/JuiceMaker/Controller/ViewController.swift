//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnEvent(juice: .strawberryBanana)
    }
    var juiceMaker = JuiceMaker()
    
    func btnEvent(juice: Juice) {
        do {
            try juiceMaker.makeJuice(of: juice)
        } catch StockError.outOfStock {
            print("재고 부족")
        } catch {
            print("알 수 없는 에러")
        }
    }
}

