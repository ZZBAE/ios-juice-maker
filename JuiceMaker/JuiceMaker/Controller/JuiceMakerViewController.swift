//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class JuiceMakerViewController: UIViewController {
    var juiceMaker = JuiceMaker()
    
    @IBOutlet weak private var strawberryLabel: UILabel!
    @IBOutlet weak private var bananaLabel: UILabel!
    @IBOutlet weak private var kiwiLabel: UILabel!
    @IBOutlet weak private var mangoLabel: UILabel!
    @IBOutlet weak private var pineappleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setStock()
    }

    @IBAction private func orderFruitJuice(_ sender: UIButton) {
        guard let juice = Juice(rawValue: sender.tag) else {
            return
        }
        make(juice: juice)
    }
    
    private func setStock() {
        let test = [strawberryLabel,
                    bananaLabel,
                    kiwiLabel,
                    mangoLabel,
                    pineappleLabel]
        var i = 0
        for stock in Fruit.allCases {
            guard let stocks = juiceMaker.fruitStore.stocks[(stock)] else {
                return
            }
            test[i]?.text = "\(stocks)"
            i += 1
        }
    }
        
    private func updateStock(juice: Juice) {
        guard let strawberry = juiceMaker.fruitStore.stocks[.strawberry],
              let banana = juiceMaker.fruitStore.stocks[.banana],
              let kiwi = juiceMaker.fruitStore.stocks[.kiwi],
              let mango = juiceMaker.fruitStore.stocks[.mango],
              let pineapple = juiceMaker.fruitStore.stocks[.pineapple]
        else {
            return
        }
        switch juice {
        case .strawberry:
            strawberryLabel.text = "\(strawberry)"
        case .banana:
            bananaLabel.text = "\(banana)"
        case .kiwi:
            kiwiLabel.text = "\(kiwi)"
        case .mango:
            mangoLabel.text = "\(mango)"
        case .pineapple:
            pineappleLabel.text = "\(pineapple)"
        case .strawberryBanana:
            strawberryLabel.text = "\(strawberry)"
            bananaLabel.text = "\(banana)"
        case .mangoKiwi:
            kiwiLabel.text = "\(kiwi)"
            mangoLabel.text = "\(mango)"
        }
    }
    
    private func make(juice: Juice) {
        do {
            try juiceMaker.makeJuice(of: juice)
            alertSuccessMakeJuice(juice: juice)
            updateStock(juice: juice)
        } catch {
            guard let error = error as? StockError else {
                return
            }
            
            switch error {
            case .outOfStock:
                alertFailMakeJuice()
                juiceMaker.fruitStore.insufficientStock.removeAll()
            case .unknown:
                alertUnknownError()
            }
        }
    }
    
    private func alertUnknownError() {
        let unknownErrorAlert = UIAlertController(title: "unknownError",
                                                  message: "알 수 없는 에러가 발생하였습니다.",
                                                  preferredStyle: .alert)
        
        unknownErrorAlert.addAction(UIAlertAction(title: "확인",
                                                  style: .default,
                                                  handler: nil))
        
        self.present(unknownErrorAlert, animated: false)
    }
    
    private func alertSuccessMakeJuice(juice: Juice) {
        let successAlert = UIAlertController(title: "성공!",
                                                  message: "\(juice)쥬스 나왔습니다! 맛있게 드세요!",
                                                  preferredStyle: .alert)
        
        successAlert.addAction(UIAlertAction(title: "확인",
                                                  style: .default,
                                                  handler: nil))
        
        self.present(successAlert, animated: false)
    }
    
    private func alertFailMakeJuice() {
        let failAlert = UIAlertController(title: "실패",
                                          message: "재료가 모자라요. 재고를 수정할까요?",
                                          preferredStyle: .alert)
        
        failAlert.addAction(UIAlertAction(title: "예",
                                          style: .default,
                                          handler: {_ in self.performSegue(withIdentifier: "moveToFruitStock", sender: nil)}))
        
        failAlert.addAction(UIAlertAction(title: "아니요",
                                          style: .cancel,
                                          handler: nil))
        
        self.present(failAlert, animated: false)
    }
}
