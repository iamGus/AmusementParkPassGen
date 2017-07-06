//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ---- Checking creation of a user ----
        do{
            // ---- Classic Guest with no errors
            //let clasicGuest = try ClassicGuest()
            
            // ---- Child with a date of birth of more than five years old
            //let child = try Child(date: GetAge(day: 13, month: 11, year: 2007))
            
            // ---- Food Services employee with no data in First name field.
            //let foodservices = try FoodServices(nameAddress: NameAddress(firstName: nil, lastName: "Peterson", streetAddress: "High Street", city: "Bath", state: "England", zipCode: "BA8 7TF", peopleType: .foodservices))
            
            // ---- Manager with "" in street Address field
            //let manager = try Manager(nameAddress: NameAddress(firstName: "Terry", lastName: "Armstrong", streetAddress: "", city: "Glasgow", state: "Scotland", zipCode: "GL3 9UR", peopleType: .manager))
            
        } catch InvalidNameAddressError.invalidDetails(errorDetails: let dataField, let user){
            print("Error: The \(dataField) field has invalid data for \(user.rawValue)")
        } catch InvalidAgeDataError.ageNotInAllowedRange {
            print("Error: Child is too old for Child Ticket")
        } catch InvalidAgeDataError.invalidAgeData {
            print("Error: invalid age format")
        } catch let error {
            fatalError("\(error)")
        }
        
        // ---------------------------------
        // ----- Checking access rights ----
        
        do{
        
        // --- Classic Guest access
        // Testing: Can access Amusement Area?, Can access Ride control? Skip Lines? Food discount?
        let classicGuestAccess = ClassicGuest()
        let classicGuestAccessArea = classicGuestAccess.isUserAllowedArea(in: .amusement)
        let classicGuestAccessArea2 = classicGuestAccess.isUserAllowedArea(in: .ridecontrol)
        let classicGuestAccessRide = classicGuestAccess.isUserAllowedRide(in: .skipAllLines)
        let classicGuestAccessDiscount = classicGuestAccess.isUserAllowedDiscount(of: .food)
        
        print("Guest user \n Can access Amusment Area: \(classicGuestAccessArea.bool) \n Can access Ride Control Area: \(classicGuestAccessArea2.bool) \n Can skip all lines: \(classicGuestAccessRide.bool) \n Has food discount: \(classicGuestAccessDiscount.description) \n")
        
        // --- VIP Guest access
        // Testing: Can access Amusement Area?, Can access Office? Skip Lines? Food discount?
        let VIPGuestAccess = VIPGuest()
        let VIPGuestAccessArea = VIPGuestAccess.isUserAllowedArea(in: .amusement)
        let VIPGuestAccessArea2 = VIPGuestAccess.isUserAllowedArea(in: .office)
        let VIPGuestAccessRide = VIPGuestAccess.isUserAllowedRide(in: .skipAllLines)
        let VIPGuestAccessDiscount = VIPGuestAccess.isUserAllowedDiscount(of: .food)
        
        print("VIP user \n Can access Amusment Area: \(VIPGuestAccessArea.bool) \n Can access Ride Control Area: \(VIPGuestAccessArea2.bool) \n Can skip all lines: \(VIPGuestAccessRide.bool) \n Has food discount: \(VIPGuestAccessDiscount.description) \n")
        
        // --- Free Child Guest access
        // Testing: Can access Amusement Area?, Can access Kitchen? Skip Lines? Merchandise discount?
        let childAccess = try Child(date: GetAge(day: 02, month: 03, year: 2015))
        let childAccessArea = childAccess.isUserAllowedArea(in: .amusement)
        let childAccessArea2 = childAccess.isUserAllowedArea(in: .kitchen)
        let childAccessRide = childAccess.isUserAllowedRide(in: .skipAllLines)
        let childAccessDiscount = childAccess.isUserAllowedDiscount(of: .merchandise)
        
        print("Child Guest user \n Can access Amusment Area: \(childAccessArea.bool) \n Can access Kitchen Area: \(childAccessArea2.bool) \n Can skip all lines: \(childAccessRide.bool) \n Has merch discount: \(childAccessDiscount.description) \n")
        
        } catch InvalidNameAddressError.invalidDetails(errorDetails: let dataField, let user){
            print("Error: The \(dataField) field has invalid data for \(user.rawValue)")
        } catch InvalidAgeDataError.ageNotInAllowedRange {
            print("Error: Child is too old for Child Ticket")
        } catch InvalidAgeDataError.invalidAgeData {
            print("Error: invalid age format")
        } catch let error {
            fatalError("\(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

