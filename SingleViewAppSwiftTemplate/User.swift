//
//  User.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 03/07/2017.
//  Copyright © 2017 Angus Muller. All rights reserved.
//

import Foundation

protocol PeopleType {
    var peopletype: PeopleAccess { get }
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    var personalInfo: [PersonalInfo] { get }
    var discountAccess: DiscountAccess { get }
}

protocol ChildType {
    var age: Int { get }
    init(age: Int)
}

protocol EmployeeType {
    var nameAddress: NameAddress { get }
    init(nameAddress: NameAddress)
}

enum PeopleAccess: String {
    case none
    case classicguest
    case vipguest
    case freechildguest = "Child Guest Pass"
    case foodservices
    case rideservices
    case maintenance
    case manager
}

enum AreaAccess {
    case amusement
    case kitchen
    case ridecontrol
    case maintenance
    case office
}

enum RideAccess {
    case allrides
    case skipAllLines
}

enum InvalidAgeDataError: Error {
    case invalidAgeData
    case ageNotInAllowedRange
}

enum PersonalInfo {
    case none
    case age
    case nameaddress
    
    static func calcAge(day: Int, month: Int, year: Int) -> Int {
        let dateOfBirth = Calendar.current.date(from: DateComponents(year: year, month: month, day: day))!
        return Calendar.current.dateComponents([.year], from: dateOfBirth, to: Date()).year!
    }
    
}

struct GetAge {
    let day: Int
    let month: Int
    let year: Int
    
    func calcAge(day: Int, month: Int, year: Int) throws -> Int {
        if let dateOfBirth = Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) {
            if let returnYear = Calendar.current.dateComponents([.year], from: dateOfBirth, to: Date()).year {
                return returnYear
            }
            throw InvalidAgeDataError.invalidAgeData
        }
        throw InvalidAgeDataError.invalidAgeData
    }
}


struct DiscountAccess {
    enum DiscountFood: String {
        case none = ""
        case ten = "10% Food Discount"
        case fifteen = "15% Food Disount"
        case twenty = "20% Food Discount"
        case twentyfive = "25% Food Discount"
    }
    
    enum DiscountMerchendise: String {
        case none = ""
        case twenty = "20% Merch Discount"
        case twentyfive = "25% Merch Discount"
    }
    
    let food: DiscountFood
    let merchendise: DiscountMerchendise
}

struct NameAddress {
    let firstName: String
    let lastName: String
    let streetAddress: String
    let city: String
    let state: String
    let zipCode: String
    
}

class People: PeopleType {
    var peopletype: PeopleAccess = .none
    var areaAccess: [AreaAccess] = [.amusement]
    var rideAccess: [RideAccess] = [.allrides]
    var personalInfo: [PersonalInfo] = [.none]
    var discountAccess: DiscountAccess = DiscountAccess(food: .none, merchendise: .none)
}

class Guest: People {
    
    
}

class ClassicGuest: Guest {
    
    override init() {
        super.init()
        self.peopletype = .classicguest
    }
    
}

class VIPGuest: Guest {
    
    override init() {
        super.init()
        self.peopletype = .vipguest
        self.rideAccess = [.skipAllLines, .allrides]
        self.discountAccess = DiscountAccess(food: .ten, merchendise: .twenty)
    }
}



class Child: Guest {
    
    var age: Int
    
    init(date: GetAge) throws {
        self.age = try date.calcAge(day: date.day, month: date.month, year: date.year)
        if age > 4 {
            throw InvalidAgeDataError.ageNotInAllowedRange
        }
        super.init()
        self.peopletype = .freechildguest
        self.rideAccess = [.allrides, .skipAllLines]
        self.personalInfo = [.age]
    }
    
}

class Employee: People, EmployeeType {
    var nameAddress: NameAddress
    
    required init(nameAddress: NameAddress) {
        self.nameAddress = nameAddress
        super.init()
    }
}

class FoodServices: Employee {
    
    required init(nameAddress: NameAddress) {
        super.init(nameAddress: nameAddress)
        self.peopletype = .foodservices
        self.areaAccess = [.amusement, .kitchen]
        self.discountAccess = DiscountAccess(food: .fifteen, merchendise: .twentyfive)
    }
}

class RideServices: Employee {
    
    required init(nameAddress: NameAddress) {
        super.init(nameAddress: nameAddress)
        self.peopletype = .rideservices
        self.areaAccess = [.amusement, .ridecontrol]
        self.discountAccess = DiscountAccess(food: .fifteen, merchendise: .twentyfive)
    }
}

class Maintenance: Employee {
    
    required init(nameAddress: NameAddress) {
        super.init(nameAddress: nameAddress)
        self.peopletype = .maintenance
        self.areaAccess = [.amusement, .kitchen, .ridecontrol, .maintenance]
        self.discountAccess = DiscountAccess(food: .fifteen, merchendise: .twentyfive)
    }
}

class Manager: Employee {
    
    required init(nameAddress: NameAddress) {
        super.init(nameAddress: nameAddress)
        self.peopletype = .manager
        self.areaAccess = [.amusement, .kitchen, .ridecontrol, .maintenance, .office]
        self.discountAccess = DiscountAccess(food: .twentyfive, merchendise: .twentyfive)
    }
}

