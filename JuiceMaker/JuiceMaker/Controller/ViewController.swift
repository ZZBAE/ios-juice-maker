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

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let starwberry = juiceMaker.fruitStore.stocks[.strawberry],
                let banana = juiceMaker.fruitStore.stocks[.banana]
        else {
            return
        }
        StockStrawberry.text = String(starwberry)
        StockBanana.text = String(banana)
    }
    
    @IBAction func makeSTBJuice(_ sender: Any) {
        btnEvent(juice: .strawberryBanana)
        StockStrawberry.text = String(juiceMaker.fruitStore.stocks[.strawberry] ?? 0)
        StockBanana.text = String(juiceMaker.fruitStore.stocks[.banana] ?? 0)
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

