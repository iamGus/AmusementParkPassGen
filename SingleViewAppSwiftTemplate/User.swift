//
//  User.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 03/07/2017.
//  Copyright © 2017 Angus Muller. All rights reserved.
//

import Foundation

protocol PeopleType {
    var entrantType: EntrantType { get }
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    var personalInfo: [PersonalInfo] { get }
    var discountAccess: DiscountAccess { get }
    func isUserAllowedInArea(_ area: AreaAccess) -> (bool: Bool, description: String)
    func isUserAllowedInRide(_ ride: RideAccess) -> (bool: Bool, description: String)
    func isUserAllowedDiscount(of discount: DiscountType) -> (bool: Bool, description: String)
}

protocol ChildType {
    var age: Int { get }
    init(age: Int)
}

protocol EmployeeType {
    var nameAddress: NameAddress { get }
    init(_ nameAddress: NameAddress)
}

enum EntrantType: String {
    case none = "Error no user selected"
    case classicguest = "Classic Guest Pass"
    case vipguest = "VIP Guest Pass"
    case freechildguest = "Child Guest Pass"
    case foodservices = "Employee Food Services Pass"
    case rideservices = "Employee Ride Services Pass"
    case maintenance = "Employee Maintenance Pass"
    case manager = "Manager Pass"
}

enum AreaAccess: String {
    case amusement = "Amusement Areas"
    case kitchen = "Kitchen"
    case ridecontrol = "Ride Control"
    case maintenance = "Maintenance"
    case office = "Office"
}

enum RideAccess: String {
    case allrides = "Access All Rides"
    case skipAllLines = "Skip All Lines"
}

enum InvalidAgeDataError: Error {
    case invalidAgeData
    case ageNotInAllowedRange(currentAge: Int)
    case missingBirthdayData
}

enum InvalidNameAddressError: Error {
    case invalidDetails(errorDetails: String, user: EntrantType)
}

enum DiscountType {
    case food
    case merchandise
}

enum PersonalInfo {
    case none
    case age
    case nameaddress
}


struct DiscountAccess {
    enum DiscountFood: String {
        case none = "No Food Discount"
        case ten = "10% Food Discount"
        case fifteen = "15% Food Discount"
        case twenty = "20% Food Discount"
        case twentyfive = "25% Food Discount"
    }
    
    enum DiscountMerchendise: String {
        case none = "No Merch Discount"
        case twenty = "20% Merch Discount"
        case twentyfive = "25% Merch Discount"
    }
    
    let food: DiscountFood
    let merchendise: DiscountMerchendise
}

//Store name and address details
struct NameAddress {
    let firstName: String
    let lastName: String
    var fullName: String { return "\(firstName) \(lastName)" }
    let streetAddress: String
    let city: String
    let state: String
    let zipCode: String
    let entrantType: EntrantType
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType) throws {
        
        self.entrantType = entrantType
        
        // Checks to make sure no blank details given
        
        guard let firstNameUnwrapped = firstName, firstNameUnwrapped != "" else {
            throw InvalidNameAddressError.invalidDetails(errorDetails: "First Name", user: self.entrantType)
        }
        
        guard let lastNameUnwrapped = lastName, lastNameUnwrapped != "" else {
            throw InvalidNameAddressError.invalidDetails(errorDetails: "Last Name", user: self.entrantType)
        }
        
        guard let streetAddressUnwrapped = streetAddress, streetAddressUnwrapped != "" else {
            throw InvalidNameAddressError.invalidDetails(errorDetails: "Street Address", user: self.entrantType)
        }
        
        guard let cityUnwrapped = city, cityUnwrapped != "" else {
            throw InvalidNameAddressError.invalidDetails(errorDetails: "City", user: self.entrantType)
        }
        
        guard let stateUnwrapped = state, stateUnwrapped != "" else {
            throw InvalidNameAddressError.invalidDetails(errorDetails: "State", user: self.entrantType)
        }
        
        guard let zipCodeUnwrapped = zipCode, zipCodeUnwrapped != "" else {
            throw InvalidNameAddressError.invalidDetails(errorDetails: "ZipCode", user: self.entrantType)
        }
        
        self.firstName = firstNameUnwrapped
        self.lastName = lastNameUnwrapped
        self.streetAddress = streetAddressUnwrapped
        self.city = cityUnwrapped
        self.state = stateUnwrapped
        self.zipCode = zipCodeUnwrapped
    }
    
}

// Super Class for all entrance types
class People: PeopleType {
    var entrantType: EntrantType = .none
    var areaAccess: [AreaAccess] = [.amusement]
    var rideAccess: [RideAccess] = [.allrides]
    var personalInfo: [PersonalInfo] = [.none]
    var discountAccess: DiscountAccess = DiscountAccess(food: .none, merchendise: .none)
    
    func isUserAllowedInArea(_ area: AreaAccess) -> (bool: Bool, description: String) {
        for eachArea in areaAccess {
            //If area provided is in that users class then allow
            if eachArea == area {
                return (true, "\(area.rawValue) access allowed")
            }
        }
        //Otherwise user not allowed in area
        return (false, "ALERT: \(area.rawValue) access not allowed")
    }
    
    
    func isUserAllowedInRide(_ ride: RideAccess) -> (bool: Bool, description: String) {
        for eachArea in rideAccess {
            //If ride access provided is also in that users class then allow
            if eachArea == ride {
                return (true, "\(ride.rawValue) access allowed")
            }
        }
        //Otherwise user not allowed in Ride Access area
        return (false, "ALERT: \(ride.rawValue) access not allowed")
    }
    
    // To work out if user is allowed discount and of how much
    func isUserAllowedDiscount(of discount: DiscountType) -> (bool: Bool, description: String) {
        //if wanting to know about food discount
        if discount == .food {
            //if there is a discount set for food
            if discountAccess.food != .none {
                return (true, "\(discountAccess.food.rawValue)")
            }
            //otherwise if no food discount
            return (false, "\(discountAccess.food.rawValue)")
        }
        //input must have been .merchendise so check if there is a discount for merch
        if discountAccess.merchendise != .none {
            return (true, "\(discountAccess.merchendise.rawValue)")
        }
        //if no merch discount
        return (false, "\(discountAccess.merchendise.rawValue)")
    }
    
}

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
    
    var age: Int
    
    init(dateOfBirth: String?) throws {
        self.age = try GetAge().calcAge(birthDate: dateOfBirth)
        //If age above 4 then throw age too high error
        if age > 4 {
            throw InvalidAgeDataError.ageNotInAllowedRange(currentAge: age)
        }
        super.init()
        self.entrantType = .freechildguest
        self.personalInfo = [.age]
    }
    
}
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

