//
//  ApplePieView.swift
//  ImagesAndScrollView
//
//  Created by Harut on 13/06/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit

func makeAppleImageViews() -> [UIImageView] {
    var apples: [UIImageView] = []
    for _ in 1...5 {
        let apple: UIImageView = UIImageView()
        apple.image = UIImage(named: "red_apple")
        apples += [apple]
    }
    
    return apples
}

func setFrames(for apples: [UIImageView], dependingOn tree: UIImageView) {
    apples[0].frame = CGRect(x: tree.frame.width/2 - 15, y: tree.frame.height/2 - 5, width: 29, height: 29)
    apples[1].frame = CGRect(x: tree.frame.width/2 - 50, y: tree.frame.height/2 - 30, width: 29, height: 29)
    apples[2].frame = CGRect(x: tree.frame.width/2 + 20, y: tree.frame.height/2 - 30, width: 29, height: 29)
    apples[3].frame = CGRect(x: tree.frame.width/2 - 50, y: tree.frame.height/2 + 30, width: 29, height: 29)
    apples[4].frame = CGRect(x: tree.frame.width/2 + 20, y: tree.frame.height/2 + 30, width: 29, height: 29)
}
