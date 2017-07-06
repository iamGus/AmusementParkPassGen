//
//  Access.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 05/07/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


// Above not used as decuded to use methods inside user class but kept here for referance

/*
class IsUserAllowed {

    func inArea(for user: PeopleType, in area: AreaAccess) -> (bool: Bool, description: String) {
        for eachArea in user.areaAccess {
            if eachArea == area {
                return (true, "\(area.rawValue) access allowd")
            }
        }
        return (false, "\(area.rawValue) access not allowed")
    }


    //I have got some DRY going on here!
    func inRide(for user: PeopleType, in area: RideAccess) -> (bool: Bool, description: String) {
        for eachArea in user.rideAccess {
            if eachArea == area {
                return (true, "\(area.rawValue) access allowd")
            }
        }
        return (false, "\(area.rawValue) access not allowed")
    }
    
    func discount(for user: PeopleType, of discount: DiscountType) -> (bool: Bool, description: String) {
        //if wanting to know about food discount
        if discount == .food {
            //if there is a discount set for food
            if user.discountAccess.food != .none {
                return (true, "\(user.discountAccess.food.rawValue)")
            }
            //otherwise if no food discount
            return (false, "\(user.discountAccess.food.rawValue)")
        }
        //input must have been .merchendise so check if there is a discount for merch
        if user.discountAccess.merchendise != .none {
            return (true, "\(user.discountAccess.merchendise.rawValue)")
        }
        //if no merch discount
        return (false, "\(user.discountAccess.merchendise.rawValue)")
    }
    
}

*/





