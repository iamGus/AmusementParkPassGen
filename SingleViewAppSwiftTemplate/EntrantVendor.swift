//
//  EntrantVendor.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 20/07/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

// Class that all vendors sub classes wil be under
class Vendor: People {
    
    var dob: String = ""
    var company: String = ""
    var dateOfVisit: String = ""
    
    var nameAddress: NameAddress
    
    init(firstName: String?, lastName: String?, entrantType: EntrantType, dateOfBirth: String?, company: String?, dateOfVisit: String?) throws {
        self.nameAddress = try NameAddress(firstName: firstName, lastName: lastName, entrantType: entrantType)
        super.init()
        if let companyHasData = company {
            self.company = companyHasData
        } else {
            throw InvalidNameAddressError.invalidCompanyName
        }
        self.dateOfVisit = try calcAge(birthDate: dateOfVisit).dob
        self.dob = try calcAge(birthDate: dateOfBirth).dob
    }
}

class VendorAcme: Vendor {
    
    override init(firstName: String?, lastName: String?, entrantType: EntrantType, dateOfBirth: String?, company: String?, dateOfVisit: String?) throws {
        try super.init(firstName: firstName, lastName: lastName, entrantType: entrantType, dateOfBirth: dateOfBirth, company: company, dateOfVisit: dateOfVisit)
        self.entrantType = .vendoracme
        self.areaAccess = [.kitchen]
        self.rideAccess = []
    }

}

class VendorOrkin: Vendor {
    
    override init(firstName: String?, lastName: String?, entrantType: EntrantType, dateOfBirth: String?, company: String?, dateOfVisit: String?) throws {
        try super.init(firstName: firstName, lastName: lastName, entrantType: entrantType, dateOfBirth: dateOfBirth, company: company, dateOfVisit: dateOfVisit)
        self.entrantType = .vendororkin
        self.areaAccess = [.amusement, .ridecontrol, .kitchen]
        self.rideAccess = []
    }
}

class VendorFedex: Vendor {
    
    override init(firstName: String?, lastName: String?, entrantType: EntrantType, dateOfBirth: String?, company: String?, dateOfVisit: String?) throws {
        try super.init(firstName: firstName, lastName: lastName, entrantType: entrantType, dateOfBirth: dateOfBirth, company: company, dateOfVisit: dateOfVisit)
        self.entrantType = .vendorfedex
        self.areaAccess = [.maintenance, .office]
        self.rideAccess = []
    }
}

class VendorNWElectrical: Vendor {
    
    override init(firstName: String?, lastName: String?, entrantType: EntrantType, dateOfBirth: String?, company: String?, dateOfVisit: String?) throws {
        try super.init(firstName: firstName, lastName: lastName, entrantType: entrantType, dateOfBirth: dateOfBirth, company: company, dateOfVisit: dateOfVisit)
        self.entrantType = .vendorneweletrical
        self.areaAccess = [.kitchen, .amusement, .maintenance, .office , .ridecontrol]
        self.rideAccess = []
    }
}


