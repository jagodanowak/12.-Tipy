//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var decimalPct: Float = 0.0
    var tip: Float = 0.0
    var people: Float = 0.0
    var tipPct: Float = 0.0

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    


    @IBAction func tipChanged(_ sender: UIButton) {
        let selectedPctButton = sender.currentTitle
        var percentage = sender.currentTitle!
        percentage.removeLast()
        decimalPct = Float(percentage)! / 100.0
        print(decimalPct)
        
    
    
        if selectedPctButton == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }
        
        if selectedPctButton == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        }
        
        if selectedPctButton == "20%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
        
        billTextField.endEditing(true)
    }
    
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperValue = sender.value
        splitNumberLabel.text = String(format: "%.0f", stepperValue)
    }

    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(billTextField.text!)!
        tipPct = decimalPct + 1
        people = Float(splitNumberLabel.text!)!

        tip = (bill / people) * tipPct
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.tip = tip
            destinationVC.people = people
            destinationVC.tipPct = tipPct
        }
    }

}

