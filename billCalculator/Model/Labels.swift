//
//  Labels.swift
//  billCalculator
//
//  Created by F1xTeoNtTsS on 02.09.2021.
//

import UIKit

struct Labels {    
    let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: FontSizes.textLabelsSize)
        label.textColor = Colors.labelsTextColor
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let result: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: FontSizes.resultLabelSize)
        label.textColor = Colors.greenColor
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(text: String){
        textLabel.text = text
        result.text = text
    }
}
