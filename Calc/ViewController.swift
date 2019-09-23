//
//  ViewController.swift
//  Calc
//
//  Created by Oliver Paray on 9/23/19.
//  Copyright © 2019 Oliver Paray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!

    var accumulator = 0.0
    var register = 0.0
    var registry = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    @IBAction func buttonPressed(sender: UIButton) {
        guard let senderLabel = sender.titleLabel,
            let senderText = senderLabel.text else { return }

        switch senderText {
        case "":
            break //TODO: Print
        case "÷":
            break //TODO: Divide
        case "×":
            break //TODO: Multiply
        case "−":
            break //TODO: Subtract
        case "+":
            break //TODO: Add
        case "=":
            break //TODO: Equate
        case "±":
            break //TODO: Negate
        case "AC":
            break //TODO: Clear
        default:
            let temp = registry.appending(senderText)
            guard let result = Double(temp) else { return }
            register = result
        }
    }
}

