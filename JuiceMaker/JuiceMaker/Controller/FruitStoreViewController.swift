//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 이은찬 on 2022/05/06.
//

import UIKit

class FruitStoreViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    
    let fruits = FruitStore.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setStock()
        strawberryStepper.value = Double(fruits.stocks[.strawberry]!)
        bananaStepper.value = Double(fruits.stocks[.banana]!)
        kiwiStepper.value = Double(fruits.stocks[.kiwi]!)
        mangoStepper.value = Double(fruits.stocks[.mango]!)
        pineappleStepper.value = Double(fruits.stocks[.pineapple]!)
    }
    
    @IBAction func strawStepper(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        switch fruit {
        case .strawberry:
            strawberryLabel.text = "\(Int(strawberryStepper.value))"
            fruits.stocks[fruit] = Int(strawberryStepper.value)
        case .banana:
            bananaLabel.text = "\(Int(bananaStepper.value))"
            fruits.stocks[fruit] = Int(bananaStepper.value)
        case .kiwi:
            kiwiLabel.text = "\(Int(kiwiStepper.value))"
            fruits.stocks[fruit] = Int(kiwiStepper.value)
        case .mango:
            mangoLabel.text = "\(Int(mangoStepper.value))"
            fruits.stocks[fruit] = Int(mangoStepper.value)
        case .pineapple:
            pineappleLabel.text = "\(Int(pineappleStepper.value))"
            fruits.stocks[fruit] = Int(pineappleStepper.value)
        }
       
    }
    
    private func setStock() {
        guard let strawberry = fruits.stocks[.strawberry],
              let banana = fruits.stocks[.banana],
              let kiwi = fruits.stocks[.kiwi],
              let mango = fruits.stocks[.mango],
              let pineapple = fruits.stocks[.pineapple]
        else {
            return
        }
        strawberryLabel.text = "\(strawberry)"
        bananaLabel.text = "\(banana)"
        kiwiLabel.text = "\(kiwi)"
        mangoLabel.text = "\(mango)"
        pineappleLabel.text = "\(pineapple)"
    }
}
