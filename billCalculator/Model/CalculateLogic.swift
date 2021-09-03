//
//  CalculateLogic.swift
//  billCalculator
//
//  Created by F1xTeoNtTsS on 03.09.2021.
//

import UIKit

struct CalculateLogic {
    var billPerPerson: BillPerPerson?
    
    var tip = 0.10
    var numberOfPeople = 2
    var bill = 0.0
    var result = 0.0
    
    func updateButtonStates(_ arrayButtons: [UIButton], _ sender: UIButton) {
        for button in arrayButtons {
            button.isSelected = false
            button.backgroundColor = .clear
            button.setTitleColor(.systemGreen, for: .normal)
        }
        sender.isSelected = true
        sender.backgroundColor = .systemGreen
        sender.setTitleColor(.white, for: .selected)
    }
    
   mutating func getTipValue(_ sender: UIButton){
        guard let tipValue = sender.currentTitle?.dropLast() else { return }
        guard let tipValueAsNumber = Double(tipValue) else { return }
        tip = tipValueAsNumber / 100
    }
    
   mutating func stepperValue(_ sender: UIStepper, _ label: UILabel) {
       let splitValue = String(format: "%.0F", sender.value)
        label.text = splitValue
        guard let splitNumber = Int(splitValue) else { return }
        numberOfPeople = splitNumber
    }
    
    mutating func calculateResult(billFromTF: String){
        guard let billNumber = Double(billFromTF) else { return }
        bill = billNumber
        result = (bill - (bill * tip)) / Double(numberOfPeople)
        billPerPerson = BillPerPerson(finalbill: String(format:"%.2F", result), numberOfPeople: numberOfPeople, tip: tip)
    }
    func getFinalBill() -> String {
        return billPerPerson?.finalbill ?? "000"
    }
    
    func getTip() -> Int {
        guard let tip = billPerPerson?.tip else {return 123}
        let tipAsInt = Int(tip*100)
       return tipAsInt
    }
    
    func getNumberOfPeople() -> Int{
        return billPerPerson?.numberOfPeople ?? 0
    }
}
