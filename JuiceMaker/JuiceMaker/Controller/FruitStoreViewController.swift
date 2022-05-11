//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by bradheo65, bonf, ZZBAE
//

import UIKit

class FruitStoreViewController: UIViewController {
    private let fruitStore = FruitStore.shared

    @IBOutlet private var labels: [UILabel]!
    
    @IBOutlet private var Stepper: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStock()
        setStepper()
    }
    
    @IBAction private func changeStepperValue(_ sender: UIStepper) {
        if let fruit = Fruit(rawValue: sender.tag) {
            labels[sender.tag].text = "\(Int(Stepper[sender.tag].value))"
            fruitStore.stocks[fruit] = Int(Stepper[sender.tag].value)
        }
    }
    
    @IBAction private func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func setStock() {
        for fruitNumber in 0..<labels.count {
            guard let fruit = Fruit(rawValue: fruitNumber) else { return }
            guard let stock = fruitStore.stocks[fruit] else { return }
            labels[fruitNumber].text = "\(stock)"
        }
    }
    
    private func setStepper() {
        for fruitNumber in 0..<labels.count {
            guard let fruit = Fruit(rawValue: fruitNumber) else { return }
            guard let stock = fruitStore.stocks[fruit] else { return }
            Stepper[fruitNumber].value = Double(stock)
        }
    }
}
