//
//  ViewController+Logic.swift
//  Calc
//
//  Created by Oliver Paray on 9/23/19.
//  Copyright © 2019 Oliver Paray. All rights reserved.
//

import Foundation

extension ViewController {

    func print(){
        performSegue(withIdentifier: "ListViewIdentifier", sender: self)
    }

    func divide(){
        if lastOp == String() {
            accumulator = register
            tape.append("\(register)")
        } else {
            if register != 0.0 {
                accumulator = accumulator / register
                tape.append("\(register) \(lastOp)")
            } else {
                displayLabel.text = "Div By Zero"
            }
        }
        register = 0
        buffer = String()
    }

    func multiply(){
        if lastOp == String() {
            accumulator = register
            tape.append("\(register)")
        } else {
            accumulator = accumulator * register
            tape.append("\(register) \(lastOp)")
        }
        register = 0
        buffer = String()
    }

    func subtract(){
        if lastOp == String() {
            accumulator = register
            tape.append("\(register)")
        } else {
            accumulator = accumulator - register
            tape.append("\(register) \(lastOp)")
        }
        register = 0
        buffer = String()
    }

    func add(){
        if lastOp == String() {
            accumulator = register
            tape.append("\(register)")
        } else {
            accumulator = accumulator + register
            tape.append("\(register) \(lastOp)")
        }
        register = 0
        buffer = String()
    }

    func negate(){
        register = 0 - register
        buffer = String(format: "-%@", buffer)
        displayLabel.text = "\(buffer)"
    }

    func equate(){
        switch lastOp {
        case "÷":
            divide()
        case "×":
            multiply()
        case "−":
            subtract()
        case "+":
            add()
        default:
            return
        }
        tape.append("\(accumulator) =")
        displayLabel.text = "\(accumulator)"
        buffer = String()
        lastOp = String()
    }

    func clear(){
        accumulator = 0.0
        register = 0.0
        buffer = String()
        lastOp = String()
        tape.append(String())
        displayLabel.text = buffer
    }

    func input(_ text: String){
        let temp = buffer.appending(text)
        guard let result = Double(temp) else { return }
        buffer = temp
        register = result
        displayLabel.text = "\(buffer)"
    }
}
