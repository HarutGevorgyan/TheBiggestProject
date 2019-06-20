//
//  ScrollViewController.swift
//  ImagesAndScrollView
//
//  Created by Harut on 10/06/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var bigImageScrollView: UIScrollView!
    @IBOutlet weak var bigImage: UIImageView!
    
    var imageArray = [#imageLiteral(resourceName: "bear"),#imageLiteral(resourceName: "cat"),#imageLiteral(resourceName: "donkey"),#imageLiteral(resourceName: "elephant"),#imageLiteral(resourceName: "cat2")]
    
    @IBAction func smallImagePressed(_ sender: UIButton) {
        bigImage.image = imageArray[sender.tag]
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return bigImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

