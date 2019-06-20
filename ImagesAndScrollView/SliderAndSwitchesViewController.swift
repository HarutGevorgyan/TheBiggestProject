//
//  SliderAndSwitchesViewController.swift
//  SliderAndSwitchesViewController
//
//  Created by Harut on 04/06/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit
import AVFoundation

class SliderAndSwitchesViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    var widthConstraint: NSLayoutConstraint?
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateForSlider(sender)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateForSlider(slider)
    }

    
    private func updateForSlider(_ slider: UISlider) {
        valueLabel.text = String(format: "%.1f", slider.value)
        widthConstraint?.isActive = false
        widthConstraint = redView.widthAnchor.constraint(equalTo: blueView.widthAnchor, multiplier: CGFloat(slider.value))
        widthConstraint?.isActive = true
        view.layoutIfNeeded()
    }
    
    
    @IBAction func switch1(_ sender: UISwitch) {
        guard let valueLabels = self.view.viewWithTag(1) else { return }
        guard let sliderView = self.view.viewWithTag(2) else { return }
        
        if valueLabels.isHidden {
            valueLabels.isHidden = false // or !valueLabels.isHidden. same comment in the cases below :)
        } else {
            if sliderView.isHidden {
                valueLabels.isHidden = true
            } else {
                sender.setOn(true, animated: false)
            }
        }
    }
    

    @IBAction func switch2(_ sender: UISwitch) {
        guard let valueLabels = self.view.viewWithTag(1) else { return }
        guard let sliderView = self.view.viewWithTag(2) else { return }
        guard let redAndBlueView = self.view.viewWithTag(3) else { return }
        
        if sliderView.isHidden {
            if !valueLabels.isHidden {
                sliderView.isHidden = false
            } else {
                sender.setOn(false, animated: false)
            }
        } else {
            if redAndBlueView.isHidden {
                sliderView.isHidden = true
            } else {
                sender.setOn(true, animated: false)
            }
        }
    }
    
    
    @IBAction func switch3(_ sender: UISwitch) {
        guard let redAndBlueView = self.view.viewWithTag(3) else { return }
        redAndBlueView.isHidden = !redAndBlueView.isHidden
    }
}

