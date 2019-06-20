//
//  Button_Extension.swift
//  Calculator_27.05.2019
//
//  Created by Harut on 27/05/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setCornerRadius(dividingWidthBy: CGFloat) {
        self.layer.cornerRadius = self.frame.size.width / dividingWidthBy
        self.clipsToBounds = true
    }
    
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: forState)
    }
}
