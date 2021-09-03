//
//  ViewController.swift
//  billCalculator
//
//  Created by F1xTeoNtTsS on 02.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let configView = ConfigView()
    var logic = CalculateLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        configView.setView(view)
        
        configView.noTipButton.tipButton.addTarget(self, action: #selector(tipButtonPressed), for: .touchUpInside)
        configView.tenTipButton.tipButton.addTarget(self, action: #selector(tipButtonPressed), for: .touchUpInside)
        configView.twentyTipButton.tipButton.addTarget(self, action: #selector(tipButtonPressed), for: .touchUpInside)
        configView.splitStepper.addTarget(self, action: #selector(stepperValueChanged), for: .touchUpInside)
        configView.calculateButton.calcButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func tipButtonPressed(_ sender: UIButton){
        logic.updateButtonStates([configView.noTipButton.tipButton,
                                  configView.tenTipButton.tipButton,
                                  configView.twentyTipButton.tipButton], sender)
        logic.getTipValue(sender)
        configView.billTextField.endEditing(true)
    }
    
    @objc func stepperValueChanged(_ sender: UIStepper){
        logic.getStepperValue(sender, configView.splitNumbersLabel.textLabel)
    }
    
    @objc func calculateButtonTapped(_ sender: UIButton){
        guard let billResult = configView.billTextField.text else { return }
        logic.getBillValue(billFromTF: billResult)
        let resultVC = ResultViewController()
        resultVC.split = logic.getNumberOfPeople()
        resultVC.tip = logic.getTip()
        resultVC.finalbill = logic.getFinalBill()
        
        present(resultVC, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


