//
//  CalculatorViewController.swift
//  Calculator_27.05.2019
//
//  Created by Harut on 27/05/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    var calculationManager = CalculationManager()
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        calculationManager.inputParser(sender)
        resultLabel.updateText(with: calculationManager.result)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        buttons.forEach {
            if $0.tag == 0 { $0.setCornerRadius(dividingWidthBy: 6) } else { $0.setCornerRadius(dividingWidthBy: 2) }
            $0.setBackgroundColor(color: .white, forState: .highlighted)
        }
    }
}
