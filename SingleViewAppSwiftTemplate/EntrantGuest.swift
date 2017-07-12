//
//  EntrantGuest.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 12/07/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

// class that all guest sub classes will be under
class Guest: People {
    
    
}

class ClassicGuest: Guest {
    
    override init() {
        super.init()
        self.entrantType = .classicguest
    }
    
}

class VIPGuest: Guest {
    
    override init() {
        super.init()
        self.entrantType = .vipguest
        self.rideAccess = [.skipAllLines, .allrides]
        self.discountAccess = DiscountAccess(food: .ten, merchendise: .twenty)
    }
}



class Child: Guest {
    
    var age: Int = 0
    
    init(dateOfBirth: String?) throws {
        super.init()
        self.age = try calcAge(birthDate: dateOfBirth)
        //If age above 4 then throw age too high error
        if age > 4 {
            throw InvalidAgeDataError.ageNotInAllowedRange(currentAge: age)
        }
        self.entrantType = .freechildguest
        self.personalInfo = [.age]
    }
    
}
