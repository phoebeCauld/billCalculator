//
//  configView.swift
//  billCalculator
//
//  Created by F1xTeoNtTsS on 02.09.2021.
//

import UIKit

class ConfigView: UIView {
    let topView = UIView()
    let topLabel = Labels(text: "Enter bill total")
    let middleLabel = Labels(text: "Select tip")
    let bottomLabel = Labels(text: "Choose split")
    let splitNumbersLabel = Labels(text: "0")
    let noTipButton = Buttons(text: "0%")
    let tenTipButton = Buttons(text: "10%")
    let twentyTipButton = Buttons(text: "20%")
    let calculateButton = Buttons(text: "Calculate")
    let billTextField: UITextField = {
        let billTF = UITextField()
        billTF.textAlignment = .center
        billTF.textColor = .systemGreen
        billTF.font = UIFont.systemFont(ofSize: FontSizes.textFieldSize)
        billTF.keyboardType = UIKeyboardType.decimalPad
        billTF.attributedPlaceholder = NSAttributedString(string: "123.56",
                                                          attributes: [NSAttributedString.Key.foregroundColor: Colors.placeholderTextColor])
        billTF.translatesAutoresizingMaskIntoConstraints = false
        return billTF
    }()
    
    let splitStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    func setView(_ view: UIView){
        topView.backgroundColor = .white
        addSubview(view)
        setConstraints(view)
    }
    
    override func addSubview(_ view: UIView) {
        [topLabel.textLabel, billTextField].forEach{topView.addSubview($0)}
        [topView,middleLabel.textLabel,bottomLabel.textLabel,calculateButton.calcButton].forEach{view.addSubview($0)}
    }
    
    func setConstraints(_ view: UIView){
        let tipButtonsStackView = tipButtonsStackView(view)
        let splitStackView = splitStackView(view)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLabel.textLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            topLabel.textLabel.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.topAnchor),
            topLabel.textLabel.heightAnchor.constraint(equalTo: topView.heightAnchor,
                                                       multiplier: Constants.labelsHeight),
            topLabel.textLabel.widthAnchor.constraint(equalTo: topView.widthAnchor,
                                                      multiplier: Constants.labelsWidth),
            
            billTextField.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            billTextField.topAnchor.constraint(equalTo: topLabel.textLabel.bottomAnchor),
            billTextField.heightAnchor.constraint(equalTo: topView.heightAnchor,
                                                  multiplier: Constants.textFieldHeight),
            billTextField.widthAnchor.constraint(equalTo: topView.widthAnchor),
            
            topView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.widthAnchor.constraint(equalTo: view.widthAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor,
                                            multiplier: Constants.topViewHeight),
            
            middleLabel.textLabel.topAnchor.constraint(equalTo: topView.bottomAnchor),
            middleLabel.textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleLabel.textLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,
                                                         multiplier: Constants.labelsWidth),
            middleLabel.textLabel.heightAnchor.constraint(equalTo: topLabel.textLabel.heightAnchor),
            
            tipButtonsStackView.topAnchor.constraint(equalTo: middleLabel.textLabel.bottomAnchor),
            tipButtonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tipButtonsStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,
                                                       multiplier: Constants.labelsWidth),
            tipButtonsStackView.heightAnchor.constraint(equalTo: billTextField.heightAnchor),
            
            bottomLabel.textLabel.topAnchor.constraint(equalTo: tipButtonsStackView.bottomAnchor),
            bottomLabel.textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomLabel.textLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,
                                                         multiplier: Constants.labelsWidth),
            bottomLabel.textLabel.heightAnchor.constraint(equalTo: topLabel.textLabel.heightAnchor),
            
            splitStackView.topAnchor.constraint(equalTo: bottomLabel.textLabel.bottomAnchor),
            splitStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splitStackView.heightAnchor.constraint(equalTo: billTextField.heightAnchor),
            splitStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,
                                                  multiplier: Constants.splitStackViewWidth),
            calculateButton.calcButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            calculateButton.calcButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.calcButton.widthAnchor.constraint(equalTo: splitStackView.widthAnchor),
            calculateButton.calcButton.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                               multiplier: Constants.calcButtonHeight)
        ])
    }
    
    func tipButtonsStackView(_ view:UIView) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [noTipButton.tipButton,tenTipButton.tipButton, twentyTipButton.tipButton])
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.spacing = 40
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    func splitStackView(_ view: UIView) -> UIStackView {
        splitNumbersLabel.textLabel.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [splitNumbersLabel.textLabel,splitStepper])
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}

enum Constants {
    static let calcButtonHeight: CGFloat = 0.05
    static let labelsHeight: CGFloat = 0.2
    static let labelsWidth: CGFloat = 0.8
    static let textFieldHeight: CGFloat = 0.5
    static let topViewHeight: CGFloat = 0.2
    static let splitStackViewWidth: CGFloat = 0.6
}
