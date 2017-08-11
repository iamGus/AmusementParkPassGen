//
//  CustomLabel.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 03/07/2017.
//  Copyright © 2017 Angus Muller. All rights reserved.
//

import UIKit

// Style for all form labels

class CustomLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        let screen = UIScreen.main
        var newFontSize = screen.bounds.size.height * (12 / 630.0);
        if (screen.bounds.size.height < 1100) {
            newFontSize = 18;
        }
        self.font = font.withSize(newFontSize)
        self.textColor = UIColor.lightGray
        
    }


}
