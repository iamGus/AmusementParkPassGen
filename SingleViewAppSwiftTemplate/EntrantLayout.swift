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
    func swipe<T: Swipe>(area: T) -> (bool: Bool, description: String)
}

//protocol ChildType {
//    var age: Int { get }
//    init(age: Int)
//}

protocol EmployeeType {
    var nameAddress: NameAddress { get }
    init(_ nameAddress: NameAddress)
}

protocol Swipe {
    
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
    case seasonguest = "Season Guest Pass"
    case seniorguest = "Senior Guest Pass"
    case contract1001 = "Contract Employee Project 1001 Pass"
    case contract1002 = "Contract Employee Project 1002 Pass"
    case contract1003 = "Contract Employee Project 1003 Pass"
    case contract2001 = "Contract Employee Project 2001 Pass"
    case contract2002 = "Contract Employee Project 2002 Pass"
    case vendoracme = "Vendor Acme Pass"
    case vendororkin = "Vendor Orkin Pass"
    case vendorfedex = "Vendor Fedex Pass"
    case vendorneweletrical = "Vendor NW Electrical Pass"
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
    case invalidCompanyName
}

enum DiscountType {
    case food
    case merchandise
}

extension AreaAccess: Swipe {}
extension RideAccess: Swipe {}
extension DiscountType: Swipe {}

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
        case ten = "10% Merch Discount"
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
    
    
    //For users who require to input all name and address details
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
    
    // for user who only need to enter first and last name
    init(firstName: String?, lastName: String?, entrantType: EntrantType) throws {
        self.entrantType = entrantType
        
        // Check to make sure no blank details given
        
        guard let firstNameUnwrapped = firstName, firstNameUnwrapped != "" else {
            throw InvalidNameAddressError.invalidDetails(errorDetails: "First Name", user: self.entrantType)
        }
        
        guard let lastNameUnwrapped = lastName, lastNameUnwrapped != "" else {
            throw InvalidNameAddressError.invalidDetails(errorDetails: "Last Name", user: self.entrantType)
        }
        
        self.firstName = firstNameUnwrapped
        self.lastName = lastNameUnwrapped
        self.streetAddress = ""
        self.city = ""
        self.state = ""
        self.zipCode = ""
        
    }
    
}



