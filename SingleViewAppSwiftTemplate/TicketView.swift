//
//  TicketView.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 03/07/2017.
//  Copyright © 2017 Angus Muller. All rights reserved.
//

import UIKit

// Style for ticket shown on TicketViewController

class TicketView: UIView {
    
    open var cornerRadius: CGFloat = 6
    
    open var shadowOffsetWidth: Int = 0
    open var shadowOffsetHeight: Int = 2
    open var shadowColor: UIColor? = UIColor.black
    open var shadowOpacity: Float = 0.4
    
    override open func layoutSubviews() {
        
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }

}
