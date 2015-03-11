//
//  MainViewController.swift
//  Custom Switch
//
//  Created by Chad Timmerman on 3/4/15.
//  Copyright (c) 2015 Chad Timmerman. All rights reserved.
//

import UIKit

let screenSize: CGRect = UIScreen.mainScreen().bounds
let screenHeight = screenSize.height
let screenWidth = screenSize.width

class MainViewController: UIViewController {
    
    var label: UILabel!
    var background: GradientView!
    var customSwitch: CustomSwitch!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBarHidden = true
        
        background = GradientView()
        background.frame = screenSize
        self.view.addSubview(background)
        
        var switchHeight: CGFloat = 174.0
        
        if screenWidth < 375 {
            switchHeight = 154.0
        }
        
        customSwitch = CustomSwitch()
        customSwitch.frame = CGRectMake(40.0, (screenHeight / 2) - 87.0, screenWidth - 80.0, switchHeight)
        customSwitch.backgroundColor = UIColor.clearColor()
        customSwitch.layer.cornerRadius = 8.0
        self.view.addSubview(customSwitch)
        
        // Setup the Label
        
        var attrSring:NSAttributedString = NSAttributedString (
            string: "SWIFTY\nSWITCH",
            attributes:[ NSKernAttributeName: 10.0 ]
        )
        
        label = UILabel()
        label.frame = CGRectMake(0.0, (screenHeight / 2) + 110.0, screenWidth, 60.0)
        label.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
        label.attributedText = attrSring
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.numberOfLines = 2
        self.view.addSubview(label)
    }

}
