//
//  FirstViewController.swift
//  KeyKeeper
//
//  Created by Erik Kappelman on 9/4/15.
//  Copyright (c) 2015 duplovici. All rights reserved.
//

import UIKit

extension Double {
    func toString() -> String {
        return String(format: "%.0f",self)
    }
}

class FirstViewController: UIViewController {


    var passwordNeedsUpperCase = false
    var passwordNeedsNumbers = false
    var passwordNeedsSymbols = false
    var passwordGen = PasswordGenerator()
    var value = "6"
    var length = 6
    var pasteBoard = UIPasteboard.generalPasteboard()
    @IBOutlet weak var uppercase: UISwitch!
    @IBOutlet weak var numbers: UISwitch!
    @IBOutlet weak var symbols: UISwitch!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var steps: UIStepper!
    @IBOutlet weak var GeneratedPassword: UILabel!
    @IBOutlet weak var Copy: UIButton!
    
    
    @IBAction func Stepper(sender: AnyObject) {
        var value = steps.value.toString()
        textField.text = value
        length = textField.text.toInt()!
    }
    @IBAction func Uppercase(sender: UISwitch) {
        passwordNeedsUpperCase = !passwordNeedsUpperCase
    }
    @IBAction func Numbers(sender: UISwitch) {
        passwordNeedsNumbers = !passwordNeedsNumbers
    }
    @IBAction func Symbols(sender: UISwitch) {
        passwordNeedsSymbols = !passwordNeedsSymbols
    }
    @IBAction func Generate(sender: UIButton) {
        let passLength:Int? = textField.text.toInt()
        GeneratedPassword.text = passwordGen.passwordGenerator(passwordNeedsUpperCase, number: passwordNeedsNumbers, symbol: passwordNeedsSymbols, len: length) as String
        Copy.setTitle("Copy", forState: UIControlState.Normal)
        passwordNeedsNumbers = false
        passwordNeedsSymbols = false
        passwordNeedsUpperCase = false
        uppercase.setOn(false, animated: true)
        numbers.setOn(false, animated: true)
        symbols.setOn(false, animated: true)
        steps.value = 6.0
        textField.text = "6"
        length = 6
    }
    
    @IBAction func ClipBoard(sender: UIButton) {
        pasteBoard.persistent = true
        print(GeneratedPassword.text!)
        pasteBoard.string = GeneratedPassword.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

