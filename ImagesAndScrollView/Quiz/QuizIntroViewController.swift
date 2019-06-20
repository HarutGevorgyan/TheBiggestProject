//
//  QuizIntroViewController.swift
//  ImagesAndScrollView
//
//  Created by Harut on 13/06/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit

class QuizIntroViewController: UIViewController {

    @IBOutlet weak var beginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        beginButton.setCornerRadius(dividingWidthBy: 8)
    }
    
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
    }
}
