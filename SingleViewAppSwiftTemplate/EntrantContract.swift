//
//  EntrantContract.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 20/07/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class ContractEmployee: Employee {
    
    var projectNumber = ""
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.rideAccess = [.none]
    }
        convenience init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType, projectNumber: String?) throws {
        try self.init(NameAddress(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType))
            if let projectNumberHasData = projectNumber, projectNumberHasData != "" {
                self.projectNumber = projectNumberHasData
            } else {
                throw InvalidNameAddressError.invalidProjectNumber
            }
    }
}

class ContractEmployee1001: ContractEmployee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .contract1001
        self.areaAccess = [.amusement, .ridecontrol]
    }
    
    convenience init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType, projectNumber: String?) throws {
        try self.init(NameAddress(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType))
        if let projectNumberHasData = projectNumber, projectNumberHasData != "" {
            self.projectNumber = projectNumberHasData
        } else {
            throw InvalidNameAddressError.invalidProjectNumber
        }
    }
}

class ContractEmployee1002: ContractEmployee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .contract1002
        self.areaAccess = [.amusement, .ridecontrol, .maintenance]
    }
    
    convenience init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType, projectNumber: String?) throws {
        try self.init(NameAddress(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType))
        if let projectNumberHasData = projectNumber, projectNumberHasData != "" {
            self.projectNumber = projectNumberHasData
        } else {
            throw InvalidNameAddressError.invalidProjectNumber
        }
    }
}

class ContractEmployee1003: ContractEmployee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .contract1003
        self.areaAccess = [.amusement, .ridecontrol, .kitchen, .office, .maintenance]
    }
    
    convenience init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType, projectNumber: String?) throws {
        try self.init(NameAddress(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType))
        if let projectNumberHasData = projectNumber, projectNumberHasData != "" {
            self.projectNumber = projectNumberHasData
        } else {
            throw InvalidNameAddressError.invalidProjectNumber
        }
    }
}

class ContractEmployee2001: ContractEmployee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .contract2001
        self.areaAccess = [.office]
    }
    
    convenience init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType, projectNumber: String?) throws {
        try self.init(NameAddress(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType))
        if let projectNumberHasData = projectNumber, projectNumberHasData != "" {
            self.projectNumber = projectNumberHasData
        } else {
            throw InvalidNameAddressError.invalidProjectNumber
        }
    }
}

class ContractEmployee2002: ContractEmployee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .contract2002
        self.areaAccess = [.kitchen, .maintenance]
    }
    
    convenience init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType, projectNumber: String?) throws {
        try self.init(NameAddress(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType))
        if let projectNumberHasData = projectNumber, projectNumberHasData != "" {
            self.projectNumber = projectNumberHasData
        } else {
            throw InvalidNameAddressError.invalidProjectNumber
        }
    }
}

