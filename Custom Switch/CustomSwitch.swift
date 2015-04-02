//
//  CustomSwitch.swift
//  Custom Switch
//
//  Created by Chad Timmerman on 3/4/15.
//  Copyright (c) 2015 Chad Timmerman. All rights reserved.
//

import UIKit

class CustomSwitch: UIView {
    
    var backgroundView: UIView!

    var onButton: UIButton!
    var offButton: UIButton!
    var buttonWindow: UIView!
    var centerCircle: UIView!
    
    var onLabelActive: UILabel!
    var onLabelInactive: UILabel!
    var offLabelActive: UILabel!
    var offLabelInactive: UILabel!
    var centerCircleLabel: UILabel!
    
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
        buttonWindow.backgroundColor = UIColor(red:0.22, green:0.22, blue:0.22, alpha:1)
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
        
        onLabelActive = UILabel()
        onLabelActive.frame = CGRectMake(0.0, (self.bounds.size.height / 2) - 25.0, self.bounds.size.width / 2, 50.0)
        onLabelActive.alpha = 1.0
        onLabelActive.text = "ON"
        onLabelActive.textAlignment = NSTextAlignment.Center
        onLabelActive.textColor = UIColor.whiteColor()
        onLabelActive.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
        onButton.addSubview(onLabelActive)
        
        onLabelInactive = UILabel()
        onLabelInactive.frame = CGRectMake(0.0, (self.bounds.size.height / 2) - 25.0, self.bounds.size.width / 2, 50.0)
        onLabelInactive.alpha = 0.0
        onLabelInactive.text = "ON"
        onLabelInactive.textAlignment = NSTextAlignment.Center
        onLabelInactive.textColor = UIColor(red:0.22, green:0.22, blue:0.22, alpha:1)
        onLabelInactive.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
        onButton.addSubview(onLabelInactive)
        
        offLabelActive = UILabel()
        offLabelActive.frame = CGRectMake(0.0, (self.bounds.size.height / 2) - 25.0, self.bounds.size.width / 2, 50.0)
        offLabelActive.alpha = 0.0
        offLabelActive.text = "OFF"
        offLabelActive.textAlignment = NSTextAlignment.Center
        offLabelActive.textColor = UIColor.whiteColor()
        offLabelActive.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
        offButton.addSubview(offLabelActive)
        
        offLabelInactive = UILabel()
        offLabelInactive.frame = CGRectMake(0.0, (self.bounds.size.height / 2) - 25.0, self.bounds.size.width / 2, 50.0)
        offLabelInactive.alpha = 1.0
        offLabelInactive.text = "OFF"
        offLabelInactive.textAlignment = NSTextAlignment.Center
        offLabelInactive.textColor = UIColor(red:0.22, green:0.22, blue:0.22, alpha:1)
        offLabelInactive.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
        offButton.addSubview(offLabelInactive)
     
        
        centerCircle = UIView()
        centerCircle.frame = CGRectMake((self.bounds.size.width / 2) - 12.0, (self.bounds.size.height / 2) - 12.0, 24.0, 24.0)
        centerCircle.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1)
        centerCircle.layer.cornerRadius = 12.0
        self.addSubview(centerCircle)
        
        centerCircleLabel = UILabel()
        centerCircleLabel.frame = CGRectMake(0.0, 0.0, 24.0, 24.0)
        centerCircleLabel.text = "or"
        centerCircleLabel.textAlignment = NSTextAlignment.Center
        centerCircleLabel.textColor = UIColor(red:0.49, green:0.49, blue:0.49, alpha:1)
        centerCircleLabel.font = UIFont(name: "AvenirNext-Regular", size: 11.0)
        centerCircle.addSubview(centerCircleLabel)
        
        isOff = false
        
    }
    
    func toggleSwitch(sender: UIButton) {
        onOrOff(!isOff)
    }
    
    func onOrOff(on : Bool){
        
        if(on == isOff){
            return
        }
        isOff = on
        
        UIView.animateWithDuration(0.4, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            
            UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 14.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                
                self.buttonWindow.frame.origin.x += self.frame.size.width / 2 * (on ? 1 : -1)
                
                }, completion: nil)
            
            self.onLabelActive.alpha = 1.0 + (on ? -1 : 1)
            self.onLabelInactive.alpha = 0.0 + (on ? 1 : -1)
            self.offLabelActive.alpha = 0.0 + (on ? 1 : -1)
            self.offLabelInactive.alpha = 1.0 + (on ? -1 : 1)
            
            self.onButton.enabled = !self.onButton.enabled
            self.offButton.enabled = !self.offButton.enabled
            
            }, completion: nil)

    }  
}
