//
//  ViewController.swift
//  Tipsy
//
//  Created by Mark Thieu
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var tip: Float = 0.0
    var numberOfPeople: Float = 2
    var billResult: String = " "

    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true
        )
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        if zeroPctButton.isSelected == true{
            tip = 0.0
        }else if tenPctButton.isSelected == true{
            tip = 0.1
        }else{
            tip = 0.2
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Float(sender.value)
        splitNumberLabel.text = String(format:"%0.f",sender.value)    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let bill = Float(billTextField.text!)
        let split = ((bill ?? 0.0) + (bill ?? 0.0)*tip)/numberOfPeople
        
        billResult = String(format: "%0.2f", split)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.result = billResult
            destinationVC.settings = "Split between \(numberOfPeople) people with \(tip*100)% tip"
            
        }
    }
    
    

}

