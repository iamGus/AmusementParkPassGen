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
    
    // To take a date of birth and return age in Int
    func calcAge(birthDate: String?) throws -> Int {
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
                return returnYear
            }
            throw InvalidAgeDataError.invalidAgeData
        }
        throw InvalidAgeDataError.invalidAgeData
    }
    
    
}
