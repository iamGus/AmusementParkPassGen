//
//  customTextField.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 03/07/2017.
//  Copyright © 2017 Angus Muller. All rights reserved.
//

import UIKit

// Style for all form textfields

class CustomTextField: UITextField {

        override var isEnabled: Bool {
            willSet {
                backgroundColor = newValue ? UIColor.white : UIColor.clear
                layer.borderColor = newValue ? UIColor.gray.cgColor : UIColor.lightGray.cgColor
            }
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            
            //Border
            self.layer.cornerRadius = 5.0
            self.layer.borderWidth = 1.5
            self.layer.borderColor = UIColor.gray.cgColor
            
            self.isEnabled = false
        }
    
    
}

