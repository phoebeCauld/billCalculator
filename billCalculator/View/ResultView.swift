//
//  ResultView.swift
//  billCalculator
//
//  Created by F1xTeoNtTsS on 03.09.2021.
//

import UIKit

class ResultView: UIView {
    let topView = UIView()
    let topResultLabel = Labels(text: "Total per person")
    let resultLabel = Labels(text: "100")
    let resultTextLabel = Labels(text: "some text")
    
    let recalculateButton = Buttons(text: "Recalculate")
    
    
    func setView(_ view: UIView){
        topView.backgroundColor = Colors.backgroundColor
        addSubview(view)
        setConstraints(view)
    }
    
    override func addSubview(_ view: UIView) {
        [resultLabel.result, topResultLabel.textLabel].forEach{topView.addSubview($0)}
        [topView, resultTextLabel.textLabel, recalculateButton.calcButton].forEach{view.addSubview($0)}
        
    }
    func setConstraints(_ view: UIView){
        topResultLabel.textLabel.textAlignment = .center
        resultTextLabel.textLabel.textAlignment = .center
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.result.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            resultLabel.result.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20),
            resultLabel.result.heightAnchor.constraint(equalTo: topView.heightAnchor,
                                                       multiplier: ResultViewConstants.resultLabelHeight),
            resultLabel.result.widthAnchor.constraint(equalTo: topView.widthAnchor,
                                                      multiplier: ResultViewConstants.resultLabelWidth),
            topResultLabel.textLabel.bottomAnchor.constraint(equalTo: resultLabel.result.topAnchor),
            topResultLabel.textLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            topResultLabel.textLabel.widthAnchor.constraint(equalTo: topView.widthAnchor,
                                                            multiplier: ResultViewConstants.labelsWidth),
            topResultLabel.textLabel.heightAnchor.constraint(equalTo: topView.heightAnchor,
                                                             multiplier: ResultViewConstants.labelsHeight),

            topView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.widthAnchor.constraint(equalTo: view.widthAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor,
                                            multiplier: ResultViewConstants.topViewHeight),
            
            resultTextLabel.textLabel.topAnchor.constraint(equalTo: topView.bottomAnchor),
            resultTextLabel.textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultTextLabel.textLabel.widthAnchor.constraint(equalTo: view.widthAnchor,
                                                             multiplier: ResultViewConstants.labelsWidth),
            resultTextLabel.textLabel.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                              multiplier: ResultViewConstants.labelsHeight),
            recalculateButton.calcButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.calcButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.calcButton.widthAnchor.constraint(equalTo: resultLabel.result.widthAnchor),
            recalculateButton.calcButton.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                                 multiplier: ResultViewConstants.calcButtonHeight)
        ])
    }
}

enum ResultViewConstants {
    static let calcButtonHeight: CGFloat = 0.05
    static let labelsHeight: CGFloat = 0.2
    static let labelsWidth: CGFloat = 0.8
    static let topViewHeight: CGFloat = 0.4
    static let resultLabelWidth: CGFloat = 0.6
    static let resultLabelHeight: CGFloat = 0.3

}
