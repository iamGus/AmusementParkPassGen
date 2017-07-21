//
//  EntrantSuper.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 12/07/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

// Super Class for all entrance types
class People: PeopleType {
    var entrantType: EntrantType = .none
    var areaAccess: [AreaAccess] = [.amusement]
    var rideAccess: [RideAccess] = [.allrides]
    var personalInfo: [PersonalInfo] = [.none]
    var discountAccess: DiscountAccess = DiscountAccess(food: .none, merchendise: .none)
    
    init() {
    }
    
    //Check access and discount swipe function
    func swipe<T: Swipe>(area: T) -> (bool: Bool, description: String) {
        
        //If swipe was AreaAccess type
        if let areaToCheck = area as? AreaAccess {
            for eachArea in areaAccess {
                //If area provided is in that users class then allow
                if eachArea == areaToCheck {
                    return (true, "\(areaToCheck.rawValue) access allowed")
                }
            }
            //Otherwise user not allowed in area
            return (false, "ALERT: \(areaToCheck.rawValue) access not allowed")
            
            //If swipe was RideAccess type
        } else if let rideToCheck = area as? RideAccess {
            for eachRide in rideAccess {
                //If area provided is in that users class then allow
                if eachRide == rideToCheck {
                    return (true, "\(rideToCheck.rawValue) access allowed")
                }
            }
            //Otherwise user not allowed in area
            return (false, "ALERT: \(rideToCheck.rawValue) access not allowed")
            
            //If swipe was DiscountType
        } else if let discountToCheck = area as? DiscountType {
            //if wanting to know about food discount
            if discountToCheck == .food {
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
        
        //In case none of above swipe types have invlaid input message but should never be called as protocol only allows Ride, Area to doscount in function parameter
        return (false, "ALERT: Invalid input")
        
    }
    
   
    
    // To take a date of birth, check correct format and return dob back abnd age in Int
    func calcAge(birthDate: String?) throws -> (age: Int, dob: String) {
        //chech there is data in string input
        guard let date = birthDate, date != "" else {
            throw InvalidAgeDataError.missingBirthdayData
        }
        // check in right string format
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd/mm/yyyy"
        //if not correctformat throw error
        guard (dateFormatterGet.date(from: date) != nil) else {
            throw InvalidAgeDataError.invalidAgeData
        }
        
        // Convert from string to date components
        let dateArr = date.components(separatedBy: "/")
        var day = 0
        var month = 0
        var year = 0
        
        if let stringDay = Int(dateArr[0]) {
            day = stringDay
        } else {
            throw InvalidAgeDataError.invalidAgeData
        }
        if let stringMonth = Int(dateArr[1]) {
            month = stringMonth
        } else {
            throw InvalidAgeDataError.invalidAgeData
        }
        
        if let stringYear = Int(dateArr[2]) {
            year = stringYear
        } else {
            throw InvalidAgeDataError.invalidAgeData
        }
        
        // Now combine all date compoents, then calculate and return age
        
        if let dateOfBirth = Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) {
            if let returnYear = Calendar.current.dateComponents([.year], from: dateOfBirth, to: Date()).year {
                return (returnYear, date)
            }
            throw InvalidAgeDataError.invalidAgeData
        }
        throw InvalidAgeDataError.invalidAgeData
    }
    
    
}
