//
//  EntrantEmployee.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 12/07/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

// Class that all employee sub classes wil be under
class Employee: People, EmployeeType {
    var nameAddress: NameAddress
    
    required init(_ nameAddress: NameAddress) {
        self.nameAddress = nameAddress
        super.init()
    }
}

class FoodServices: Employee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .foodservices
        self.areaAccess = [.amusement, .kitchen]
        self.discountAccess = DiscountAccess(food: .fifteen, merchendise: .twentyfive)
    }
}

class RideServices: Employee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .rideservices
        self.areaAccess = [.amusement, .ridecontrol]
        self.discountAccess = DiscountAccess(food: .fifteen, merchendise: .twentyfive)
    }
}

class Maintenance: Employee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .maintenance
        self.areaAccess = [.amusement, .kitchen, .ridecontrol, .maintenance]
        self.discountAccess = DiscountAccess(food: .fifteen, merchendise: .twentyfive)
    }
}

class Manager: Employee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .manager
        self.areaAccess = [.amusement, .kitchen, .ridecontrol, .maintenance, .office]
        self.discountAccess = DiscountAccess(food: .twentyfive, merchendise: .twentyfive)
    }
}
