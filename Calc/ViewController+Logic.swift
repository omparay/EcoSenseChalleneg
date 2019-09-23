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

    }

    func divide(){
        if lastOp == String() {
            accumulator = register
        } else {
            if register != 0.0 {
                accumulator = accumulator / register
            } else {
                displayLabel.text = "Div By Zero"
            }
        }
        register = 0
        registry = String()
    }

    func multiply(){
        if lastOp == String() {
            accumulator = register
        } else {
            accumulator = accumulator * register
        }
        register = 0
        registry = String()
    }

    func subtract(){
        if lastOp == String() {
            accumulator = register
        } else {
            accumulator = accumulator - register
        }
        register = 0
        registry = String()
    }

    func add(){
        if lastOp == String() {
            accumulator = register
        } else {
            accumulator = accumulator + register
        }
        register = 0
        registry = String()
    }

    func negate(){
        register = 0 - register
        registry = String(format: "-%@", registry)
        displayLabel.text = "\(registry)"
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
        displayLabel.text = "\(accumulator)"
        registry = String()
        lastOp = String()
    }

    func clear(){
        accumulator = 0.0
        register = 0.0
        registry = String()
        lastOp = String()
        tape = [String]()
        displayLabel.text = registry
    }

    func input(_ text: String){
        let temp = registry.appending(text)
        debugPrint(temp)
        guard let result = Double(temp) else { return }
        debugPrint(result)
        registry = temp
        register = result
        displayLabel.text = "\(registry)"
    }
}
