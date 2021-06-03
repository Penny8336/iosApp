//
//  ViewController.swift
//  calculator
//
//  Created by 羅珮珊 on 2021/4/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sumClicked(_ sender: Any) {
        let firstNumber = Int(firstText.text!)!
        let secondNumber = Int(secondText.text!)!
        
        let result = firstNumber + secondNumber
        resultLabel.text = String(result)
    }
    
    
    @IBAction func minusClicked(_ sender: Any) {
        let firstNumber = Int(firstText.text!)!
        let secondNumber = Int(secondText.text!)!
        
        let result = firstNumber - secondNumber
        resultLabel.text = String(result)
    }
    
    
    @IBAction func multiplyClicked(_ sender: Any) {
        let firstNumber = Int(firstText.text!)!
        let secondNumber = Int(secondText.text!)!
        
        let result = firstNumber * secondNumber
        resultLabel.text = String(result)
    }
    
    
    @IBAction func divideClicked(_ sender: Any) {
        let firstNumber = Int(firstText.text!)!
        let secondNumber = Int(secondText.text!)!
        
        let result = firstNumber / secondNumber
        resultLabel.text = String(result)
    }
    
}

