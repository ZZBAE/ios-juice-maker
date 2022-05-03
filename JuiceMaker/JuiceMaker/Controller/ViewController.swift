//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
        
    @IBOutlet weak var StockStrawberry: UILabel!
    @IBOutlet weak var StockBanana: UILabel!
    @IBOutlet weak var StockPineapple: UILabel!
    @IBOutlet weak var StockKiwi: UILabel!
    @IBOutlet weak var StockMango: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStocks()
    }
    
    @IBAction func makeStrawberryJuice(_ sender: Any) {
        btnEvent(juice: .strawberry)
        updateStocks()
    }
    
    @IBAction func makeBananaJuice(_ sender: Any) {
        btnEvent(juice: .banana)
        updateStocks()
    }
    
    @IBAction func makePineappleJuice(_ sender: Any) {
        btnEvent(juice: .pineapple)
        updateStocks()
    }
    
    @IBAction func makeKiwiJuice(_ sender: Any) {
        btnEvent(juice: .kiwi)
        updateStocks()
    }
    
    @IBAction func makeMangoJuice(_ sender: Any) {
        btnEvent(juice: .mango)
        updateStocks()
    }
        
    @IBAction func makeStrawberryBananaJuice(_ sender: Any) {
        btnEvent(juice: .strawberryBanana)
        updateStocks()
    }

    @IBAction func makeMangoKiwiJuice(_ sender: Any) {
        btnEvent(juice: .mangoKiwi)
        updateStocks()
    }
 
    @IBSegueAction func moveStockStage(_ coder: NSCoder) -> UIViewController? {
        return UIViewController(coder: coder)
    }
    
    func btnEvent(juice: Juice) {
        do {
            try juiceMaker.makeJuice(of: juice)
            makeSuccessAlert(juice: juice)
        } catch StockError.outOfStock {
            print("재고 부족")
            makeFailAlert(juice: juice)
        } catch {
            print("알 수 없는 에러")
        }
    }
    
    func updateStocks() {
        guard let strawberry = juiceMaker.fruitStore.stocks[.strawberry],
              let banana = juiceMaker.fruitStore.stocks[.banana],
              let kiwi = juiceMaker.fruitStore.stocks[.kiwi],
              let mango = juiceMaker.fruitStore.stocks[.mango],
              let pineapple = juiceMaker.fruitStore.stocks[.pineapple]
        else {
            return
        }
        StockStrawberry.text = "\(strawberry)"
        StockBanana.text = "\(banana)"
        StockKiwi.text = "\(kiwi)"
        StockMango.text = "\(mango)"
        StockPineapple.text = "\(pineapple)"
    }
    
    func makeSuccessAlert(juice: Juice) {
        let productionSuccess = UIAlertController(title: "성공!!",
                                                  message: "\(juice) 쥬스 나왔습니다! 맛있게 드세요!",
                                                  preferredStyle: .alert)
        
        productionSuccess.addAction(UIAlertAction(title: "확인",
                                                  style: .default,
                                                  handler: { _ in print("확인 클릭") }))
        present(productionSuccess, animated: true)
    }
    
    func makeFailAlert(juice: Juice) {
        let productionFail = UIAlertController(title: "실패!!",
                                               message: "\(juice) 쥬스 재료가 모자라요. 재고를 수정할까요?",
                                               preferredStyle: .alert)
        
        productionFail.addAction(UIAlertAction(title: "예",
                                               style: .default,
                                               handler: { _ in
            print("예 클릭")
            self.performSegue(withIdentifier: "ShowFruitStock", sender: nil)
        }))
        
        productionFail.addAction(UIAlertAction(title: "아니요",
                                               style: .destructive,
                                               handler: { _ in
            print("아니요 클릭")
        }))
        present(productionFail, animated: true)
    }
}

