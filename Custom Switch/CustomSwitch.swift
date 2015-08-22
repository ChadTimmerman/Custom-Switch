//
//  CustomSwitch.swift
//  Custom Switch
//
//  Created by Chad Timmerman on 3/4/15.
//  Copyright (c) 2015 Chad Timmerman. All rights reserved.
//

import UIKit

class CustomSwitch: UIView {
    
    private var backgroundView: UIView!

    private var onButton: UIButton!
    private var offButton: UIButton!
    private var buttonWindow: UIView!
    
    private var onLabel: UILabel!
    private var offLabel: UILabel!
    private var centerCircleLabel: UILabel!
    
    private struct SwitchColor {
      static let on = UIColor.whiteColor()
      static let off = UIColor(red:0.22, green:0.22, blue:0.22, alpha:1)
    }
  
    var isOff: Bool!

    override func drawRect(rect: CGRect) {
    
        backgroundView = UIView()
        backgroundView.frame = self.bounds
        backgroundView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        backgroundView.layer.cornerRadius = 4.0
        self.addSubview(backgroundView)
        
        // Setup the Sliding Window
        
        buttonWindow = UIView()
        buttonWindow.frame = CGRectMake(0.0, 0.0, self.bounds.size.width / 2, self.bounds.size.height)
        buttonWindow.backgroundColor = SwitchColor.off
        buttonWindow.layer.cornerRadius = 4.0
        self.addSubview(buttonWindow)
        
        // Setup the Buttons
        
        onButton = UIButton()
        onButton.frame = CGRectMake(0.0, 0.0, self.bounds.size.width / 2, self.bounds.size.height)
        onButton.backgroundColor = UIColor.clearColor()
        onButton.enabled = false
        onButton.addTarget(self, action: "toggleSwitch:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(onButton)
        
        offButton = UIButton()
        offButton.frame = CGRectMake(self.bounds.size.width / 2, 0.0, self.bounds.size.width / 2, self.bounds.size.height)
        offButton.backgroundColor = UIColor.clearColor()
        offButton.enabled = true
        offButton.addTarget(self, action: "toggleSwitch:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(offButton)

        // Setup the Labels
        
        onLabel = UILabel()
        onLabel.frame = CGRectMake(0.0, (self.bounds.size.height / 2) - 25.0, self.bounds.size.width / 2, 50.0)
        onLabel.alpha = 1.0
        onLabel.text = "ON"
        onLabel.textAlignment = NSTextAlignment.Center
        onLabel.textColor = SwitchColor.on
        onLabel.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
        onButton.addSubview(onLabel)
        
        offLabel = UILabel()
        offLabel.frame = CGRectMake(0.0, (self.bounds.size.height / 2) - 25.0, self.bounds.size.width / 2, 50.0)
        offLabel.alpha = 1.0
        offLabel.text = "OFF"
        offLabel.textAlignment = NSTextAlignment.Center
        offLabel.textColor = SwitchColor.off
        offLabel.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
        offButton.addSubview(offLabel)
        
        // Set up the center Label
        
        centerCircleLabel = UILabel()
        centerCircleLabel.frame = CGRectMake((self.bounds.size.width / 2) - 12.0, (self.bounds.size.height / 2) - 12.0, 24.0, 24.0)
        centerCircleLabel.text = "or"
        centerCircleLabel.textAlignment = NSTextAlignment.Center
        centerCircleLabel.textColor = UIColor(red:0.49, green:0.49, blue:0.49, alpha:1)
        centerCircleLabel.font = UIFont(name: "AvenirNext-Regular", size: 11.0)
        centerCircleLabel.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1)
        centerCircleLabel.layer.cornerRadius = 12.0
        centerCircleLabel.clipsToBounds = true
        self.addSubview(centerCircleLabel)
        
        isOff = false
        
    }
    
    func toggleSwitch(sender: UIButton) {
        onOrOff(!isOff)
    }

    private func onOrOff(on : Bool){
        
        guard on != isOff else { return }

        isOff = on
        
        UIView.animateWithDuration(0.4,
            delay: 0.0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 14.0,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: { () -> Void in
                self.buttonWindow.frame.origin.x += self.frame.size.width / 2 * (on ? 1 : -1)
            },
            completion: nil)
        
        animateLabel(self.offLabel, toColor: (on ? SwitchColor.on : SwitchColor.off))
        animateLabel(self.onLabel, toColor: (on ? SwitchColor.off : SwitchColor.on))
        
        self.onButton.enabled = !self.onButton.enabled
        self.offButton.enabled = !self.offButton.enabled

    }
    
    private func animateLabel(label : UILabel!, toColor : UIColor){
        UIView.transitionWithView(label,
            duration: 0.4,
            options: [.CurveEaseOut, .TransitionCrossDissolve, .BeginFromCurrentState],
            animations: { () -> Void in
                label.textColor = toColor
            },
            completion: nil)
    }
}
