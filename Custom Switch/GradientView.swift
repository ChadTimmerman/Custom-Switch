//
//  GradientView.swift
//  Custom Switch
//
//  Created by Chad Timmerman on 3/4/15.
//  Copyright (c) 2015 Chad Timmerman. All rights reserved.
//

import UIKit

class GradientView: UIView {

    override func drawRect(rect: CGRect) {
        
        let currentContext = UIGraphicsGetCurrentContext()
        
        CGContextSaveGState(currentContext)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // Top Color
        let startColor = UIColor(red:1, green:0.37, blue:0.23, alpha:1)
        let startColorComponents = CGColorGetComponents(startColor.CGColor)
        
        //Bottom Color
        let endColor = UIColor(red:1, green:0.16, blue:0.41, alpha:1)
        let endColorComponents = CGColorGetComponents(endColor.CGColor)
        
        var colorComponents
        = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
        
        var locations:[CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradientCreateWithColorComponents(colorSpace,&colorComponents,&locations,2)
        
        let startPoint = CGPoint(x: screenWidth, y: 0.0)
        let endPoint = CGPoint(x: screenWidth, y: screenHeight)
      
        CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, [])
      
        CGContextRestoreGState(currentContext)
    }

}
