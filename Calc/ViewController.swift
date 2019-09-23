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

    var accumulator = 0.0 {
        didSet {
            debugPrint("Accumulator: \(self.accumulator)")
        }
    }
    var register = 0.0 {
        didSet {
            debugPrint("Register: \(self.register)")
        }
    }
    var buffer = String() {
        didSet {
            debugPrint("Buffer: \(self.buffer)")
        }
    }
    var lastOp = String() {
        didSet {
            debugPrint("LastOp: \(self.lastOp)")
        }
    }
    var tape = [String]()

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
        case "🖨":
            print()
        case "÷":
            divide()
            lastOp = senderText
        case "×":
            multiply()
            lastOp = senderText
        case "−":
            subtract()
            lastOp = senderText
        case "+":
            add()
            lastOp = senderText
        case "=":
            equate()
        case "±":
            negate()
        case "AC":
            clear()
        default:
            input(senderText)
        }
    }
}

