//
//  Buttons.swift
//  billCalculator
//
//  Created by F1xTeoNtTsS on 02.09.2021.
//

import UIKit

struct Buttons {
    
    let tipButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSizes.tipButtonSize)
        button.backgroundColor = .clear
        button.setTitleColor(Colors.greenColor, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let calcButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.greenColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSizes.calculateButtonSize)
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(text: String) {
        tipButton.setTitle(text, for: .normal)
        calcButton.setTitle(text, for: .normal)
    }
}
