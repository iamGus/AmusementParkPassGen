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
        
        // ---------------------------------------------------------
        // ---- Checking creation of a user and checking errors ----
        // ---- Uncomment instances below to check error results ---
        // ---------------------------------------------------------
        
        do{
            // ---- Classic Guest with no errors
            //let classicGuest = try ClassicGuest()
            //print(classicGuest)
            
            // ---- Child with a date of birth of more than five years old
            // ---- Will get too old error message
            //let child = try Child(date: GetAge(day: 13, month: 11, year: 2007))
            
            // ---- Child with missing birthday ----
            let child = try Child(dateOfBirth: "12/04/2014")
            print(child.age)
            
            // ---- Food Services employee with no data in First name field.
            // ---- Will inform user no data in First Name field
            //let foodservices = try FoodServices(nameAddress: NameAddress(firstName: nil, lastName: "Peterson", streetAddress: "High Street", city: "Bath", state: "England", zipCode: "BA8 7TF", peopleType: .foodservices))
            
            // ---- Manager with "" in Street Address field
            // ---- Will inform user no data in Street Address field
            //let manager = try Manager(nameAddress: NameAddress(firstName: "Terry", lastName: "Armstrong", streetAddress: "", city: "Glasgow", state: "Scotland", zipCode: "GL3 9UR", peopleType: .manager))
            
        } catch InvalidNameAddressError.invalidDetails(errorDetails: let dataField, let user){
            print("Error: The \(dataField) field has no data for \(user.rawValue). Cannot create ticket for \(user.rawValue).")
        } catch InvalidAgeDataError.ageNotInAllowedRange(currentAge: let currentAge) {
            print("Error: Child is too old for Child Ticket, Child is \(currentAge) and needs to be under 5 for a Child ticket. Cannot create ticket.")
        } catch InvalidAgeDataError.missingBirthdayData {
            print("Error: Missing data in age")
        } catch InvalidAgeDataError.invalidAgeData {
            print("Error: invalid age format")
        } catch let error {
            fatalError("\(error)")
        }
        
        // ---------------------------------
        // ----- Checking access rights ----
        // ----- Un-comment case to test ---
        
        do{
        
        // --- Classic Guest access
        // Testing: Can access Amusement Area?, Can access Ride control? Skip Lines? Food discount?
    /*
        let classicGuestAccess = ClassicGuest()
        let classicGuestAccessArea = classicGuestAccess.isUserAllowedArea(in: .amusement)
        let classicGuestAccessArea2 = classicGuestAccess.isUserAllowedArea(in: .ridecontrol)
        let classicGuestAccessRide = classicGuestAccess.isUserAllowedRide(in: .skipAllLines)
        let classicGuestAccessDiscount = classicGuestAccess.isUserAllowedDiscount(of: .food)
        
        print("Guest user \n \(classicGuestAccessArea.description) \n \(classicGuestAccessArea2.description) \n \(classicGuestAccessRide.description) \n \(classicGuestAccessDiscount.description) \n")
        
    */
 
        // --- VIP Guest access
        // Testing: Can access Amusement Area?, Can access Office? Skip Lines? Food discount?
    /*
        let VIPGuestAccess = VIPGuest()
        let VIPGuestAccessArea = VIPGuestAccess.isUserAllowedArea(in: .amusement)
        let VIPGuestAccessArea2 = VIPGuestAccess.isUserAllowedArea(in: .office)
        let VIPGuestAccessRide = VIPGuestAccess.isUserAllowedRide(in: .skipAllLines)
        let VIPGuestAccessDiscount = VIPGuestAccess.isUserAllowedDiscount(of: .food)
        
        print("VIP user \n \(VIPGuestAccessArea.description) \n \(VIPGuestAccessArea2.description) \n \(VIPGuestAccessRide.description) \n \(VIPGuestAccessDiscount.description) \n")
            
    */
        
        // --- Free Child Guest access
        // Testing: Can access Amusement Area?, Can access Kitchen? Skip Lines? Merchandise discount?
    /*
        let childAccess = try Child(date: GetAge(day: 02, month: 03, year: 2015))
        let childAccessArea = childAccess.isUserAllowedArea(in: .amusement)
        let childAccessArea2 = childAccess.isUserAllowedArea(in: .kitchen)
        let childAccessRide = childAccess.isUserAllowedRide(in: .skipAllLines)
        let childAccessDiscount = childAccess.isUserAllowedDiscount(of: .merchandise)
        
        print("Child Guest user \n \(childAccessArea.description) \n \(childAccessArea2.description) \n \(childAccessRide.description) \n \(childAccessDiscount.description) \n")
    */
        // --- Food Service Employee access
        // Testing: Can access Amusement Area?, Can access Kitchen? Can access Maintenance Area?, Skip all lines?, Merchandise discount?
    /*
        let foodServicesAccess = try FoodServices(nameAddress: NameAddress(firstName: "Fred", lastName: "Power", streetAddress: "Meddow Lane", city: "Glasgow", state: "Scotland", zipCode: "GL9 8YR", peopleType: .foodservices))
        let foodServicesAccessArea = foodServicesAccess.isUserAllowedArea(in: .amusement)
        let foodServicesAccessArea2 = foodServicesAccess.isUserAllowedArea(in: .kitchen)
        let foodServicesAccessArea3 = foodServicesAccess.isUserAllowedArea(in: .maintenance)
        let foodServicesAccessRide = foodServicesAccess.isUserAllowedRide(in: .skipAllLines)
        let foodServicesAccessDiscount = foodServicesAccess.isUserAllowedDiscount(of: .merchandise)
        
        print("Food Services Employee user \n \(foodServicesAccessArea.description) \n \(foodServicesAccessArea2.description) \n \(foodServicesAccessArea3.description) \n \(foodServicesAccessRide.description) \n \(foodServicesAccessDiscount.description) \n")
    */
        // --- Ride Service Employee access
        // Testing: Can access Amusement Area?, Can access Ride Control? Can access Office Area?, Skip lines? food discount?
    /*
        let rideServicesAccess = try RideServices(nameAddress: NameAddress(firstName: "Fred", lastName: "Power", streetAddress: "Meddow Lane", city: "Glasgow", state: "Scotland", zipCode: "GL9 8YR", peopleType: .rideservices))
        let rideServicesAccessArea = rideServicesAccess.isUserAllowedArea(in: .amusement)
        let rideServicesAccessArea2 = rideServicesAccess.isUserAllowedArea(in: .ridecontrol)
        let rideServicesAccessArea3 = rideServicesAccess.isUserAllowedArea(in: .office)
        let rideServicesAccessRide = rideServicesAccess.isUserAllowedRide(in: .skipAllLines)
        let rideServicesAccessDiscount = rideServicesAccess.isUserAllowedDiscount(of: .food)
        
        print("Ride Services Employee user \n \(rideServicesAccessArea.description) \n \(rideServicesAccessArea2.description) \n \(rideServicesAccessArea3.description) \n \(rideServicesAccessRide.description) \n \(rideServicesAccessDiscount.description) \n")
    */
        // --- Maintenance Employee access
        // Testing: Can access Amusement Area?, Can access Maintenance? Can access Office Area?, Can access Ride Control? Skip lines? Merchandise discount?
    /*
        let maintenanceAccess = try Maintenance(nameAddress: NameAddress(firstName: "Fred", lastName: "Power", streetAddress: "Meddow Lane", city: "Glasgow", state: "Scotland", zipCode: "GL9 8YR", peopleType: .maintenance))
        let maintenanceAccessArea = maintenanceAccess.isUserAllowedArea(in: .amusement)
        let maintenanceAccessArea2 = maintenanceAccess.isUserAllowedArea(in: .maintenance)
        let maintenanceAccessArea3 = maintenanceAccess.isUserAllowedArea(in: .office)
        let maintenanceAccessArea4 = maintenanceAccess.isUserAllowedArea(in: .ridecontrol)
        let maintenanceAccessRide = maintenanceAccess.isUserAllowedRide(in: .skipAllLines)
        let maintenanceAccessDiscount = maintenanceAccess.isUserAllowedDiscount(of: .merchandise)
        
        print("Maintenance Employee user \n \(maintenanceAccessArea.description) \n \(maintenanceAccessArea2.description) \n \(maintenanceAccessArea3.description) \n \(maintenanceAccessArea4.description) \n \(maintenanceAccessRide.description) \n \(maintenanceAccessDiscount.description) \n")
    */
            
            
        // --- Manager Employee access
        // Testing: Can access Amusement Area?, Can access Maintenance? Can access Office Area?, Can access Ridr Control? Skip lines? Merchandise discount?
    /*
        let managerAccess = try Manager(nameAddress: NameAddress(firstName: "Fred", lastName: "Power", streetAddress: "Meddow Lane", city: "Glasgow", state: "Scotland", zipCode: "GL9 8YR", peopleType: .maintenance))
        let managerAccessArea = managerAccess.isUserAllowedArea(in: .amusement)
        let managerAccessArea2 = managerAccess.isUserAllowedArea(in: .maintenance)
        let managerAccessArea3 = managerAccess.isUserAllowedArea(in: .office)
        let managerAccessArea4 = managerAccess.isUserAllowedArea(in: .ridecontrol)
        let managerAccessRide = managerAccess.isUserAllowedRide(in: .skipAllLines)
        let managerAccessDiscount = managerAccess.isUserAllowedDiscount(of: .merchandise)
        
        print("Manager Employee user \n \(managerAccessArea.description) \n \(managerAccessArea2.description) \n \(managerAccessArea3.description) \n \(managerAccessArea4.description) \n \(managerAccessRide.description) \n \(managerAccessDiscount.description) \n")
    */
        } catch InvalidNameAddressError.invalidDetails(errorDetails: let dataField, let user){
            print("Error: The \(dataField) field has invalid data for \(user.rawValue)")
        } catch InvalidAgeDataError.ageNotInAllowedRange(currentAge: let currentAge) {
            print("Error: Child is too old for Child Ticket, Child is \(currentAge) and needs to be under 5 for a Child ticket")
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

