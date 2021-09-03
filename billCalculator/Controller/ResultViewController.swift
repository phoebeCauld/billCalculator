//
//  ResultViewController.swift
//  billCalculator
//
//  Created by F1xTeoNtTsS on 03.09.2021.
//

import UIKit

class ResultViewController: UIViewController {

    let setResultView = ResultView()
    var finalbill: String?
    var split: Int?
    var tip: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateTextLabels()
        setResultView.recalculateButton.calcButton.addTarget(self, action: #selector(recalculateButtonTapped), for: .touchUpInside)
        setResultView.setView(view)
    }
    
    func updateTextLabels(){
        guard let numberOfPeople = split else { return }
        guard let tipValue = tip else { return }
        setResultView.resultLabel.result.text = finalbill
        setResultView.resultTextLabel.textLabel.text = "Split between \(numberOfPeople) people, with \(tipValue) % tip."
    }
  
    @objc func recalculateButtonTapped(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}
