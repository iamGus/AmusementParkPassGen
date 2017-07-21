//
//  EntrantContract.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 20/07/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class ContractEmployee: Employee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.rideAccess = []
    }
}

class ContractEmployee1001: ContractEmployee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .contract1001
        self.areaAccess = [.amusement, .ridecontrol]
    }
}

class ContractEmployee1002: ContractEmployee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .contract1002
        self.areaAccess = [.amusement, .ridecontrol, .maintenance]
    }
}

class ContractEmployee1003: ContractEmployee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .contract1003
        self.areaAccess = [.amusement, .ridecontrol, .kitchen, .office, .maintenance]
    }
}

class ContractEmployee2001: ContractEmployee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .contract2001
        self.areaAccess = [.office]
    }
}

class ContractEmployee2002: ContractEmployee {
    
    required init(_ nameAddress: NameAddress) {
        super.init(nameAddress)
        self.entrantType = .contract2002
        self.areaAccess = [.kitchen, .maintenance]
    }
}

