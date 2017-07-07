//
//  Age.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 07/07/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct GetAge {
    
    
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
