//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Angus Muller on 03/07/2017.
//  Copyright © 2017 Angus Muller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ---------------------------------------------------------
        // ---- Checking creation of a user ticket and checking errors ----
        // ---- Uncomment instances below to check error results ---
        // ---------------------------------------------------------
        
        do{
            // ---- Classic Guest with no errors
            //let classicGuest = try ClassicGuest()
            //print(classicGuest)
            
            // ---- Child with missing birthday ----
            //let child = try Child(dateOfBirth: nil)
            
            // ---- Child with wrong birthday format ----
            //let child = try Child(dateOfBirth: "07/October/2015")
            
            // ---- Child older than five, bring back too old message ----
            //let child = try Child(dateOfBirth: "04/03/2011")
            
            // ---- Child 3 years old, ticket created, no error ----
            //let child = try Child(dateOfBirth: "04/03/2014")
            //print(child.age)
            
            // ---- Food Services employee with no data in First name field.
            // ---- Will inform user no data in First Name field
            //let foodservices = try FoodServices(NameAddress(firstName: nil, lastName: "Peterson", streetAddress: "High Street", city: "Bath", state: "England", zipCode: "BA8 7TF", entrantType: .foodservices))
            
            // ---- Manager with "" in Street Address field
            // ---- Will inform user no data in Street Address field
            //let manager = try Manager(NameAddress(firstName: "Terry", lastName: "Armstrong", streetAddress: "", city: "Glasgow", state: "Scotland", zipCode: "GL3 9UR", entrantType: .manager))
            
            // ---- Ride Services with complete correct data, instance created
            //let rideServices = try RideServices(NameAddress(firstName: "John", lastName: "Potter", streetAddress: "76 Peach Street", city: "Oxford", state: "Oxfordshire", zipCode: "JY8 6FR", entrantType: .rideservices))
            //print(rideServices.nameAddress.fullName)
            
        } catch InvalidNameAddressError.invalidDetails(errorDetails: let dataField, let user){
            print("Error: The \(dataField) field has no data for \(user.rawValue). Cannot create ticket for \(user.rawValue).")
        } catch InvalidAgeDataError.ageNotInAllowedRange(currentAge: let currentAge) {
            print("Error: Child is too old for Child Ticket, Child is \(currentAge) and needs to be under 5 for a Child ticket. Cannot create ticket.")
        } catch InvalidAgeDataError.missingBirthdayData {
            print("Error: You have not provided a date of birth")
        } catch InvalidAgeDataError.invalidAgeData {
            print("Error: invalid age format, must be in format dd/mm/yyyy")
        } catch let error {
            fatalError("\(error)")
        }
        
        // ---------------------------------
        // ----- Checking access rights ----
        // ----- Un-comment case to test ---
        // ---------------------------------
        
        do{
        
        // --- Classic Guest access
        // Testing: Can access Amusement Area?, Can access Ride control? Skip Lines? Food discount?
    /*
        let classicGuestAccess = ClassicGuest()
        let classicGuestAccessArea = classicGuestAccess.isUserAllowedInArea(.amusement)
        let classicGuestAccessArea2 = classicGuestAccess.isUserAllowedInArea(.ridecontrol)
        let classicGuestAccessRide = classicGuestAccess.isUserAllowedInRide(.skipAllLines)
        let classicGuestAccessDiscount = classicGuestAccess.isUserAllowedDiscount(of: .food)
        
        print("Guest user \n \(classicGuestAccessArea.description) \n \(classicGuestAccessArea2.description) \n \(classicGuestAccessRide.description) \n \(classicGuestAccessDiscount.description) \n")
     */
    
 
        // --- VIP Guest access
        // Testing: Can access Amusement Area?, Can access Office? Skip Lines? Food discount?
    /*
        let VIPGuestAccess = VIPGuest()
        let VIPGuestAccessArea = VIPGuestAccess.isUserAllowedInArea(.amusement)
        let VIPGuestAccessArea2 = VIPGuestAccess.isUserAllowedInArea(.office)
        let VIPGuestAccessRide = VIPGuestAccess.isUserAllowedInRide(.skipAllLines)
        let VIPGuestAccessDiscount = VIPGuestAccess.isUserAllowedDiscount(of: .food)
        
        print("VIP user \n \(VIPGuestAccessArea.description) \n \(VIPGuestAccessArea2.description) \n \(VIPGuestAccessRide.description) \n \(VIPGuestAccessDiscount.description) \n")
            
    */
        
        // --- Free Child Guest access
        // Testing: Can access Amusement Area?, Can access Kitchen? Skip Lines? Merchandise discount?
    /*
        let childAccess = try Child(dateOfBirth: "21/01/2015")
        let childAccessArea = childAccess.isUserAllowedInArea(.amusement)
        let childAccessArea2 = childAccess.isUserAllowedInArea(.kitchen)
        let childAccessRide = childAccess.isUserAllowedInRide(.skipAllLines)
        let childAccessDiscount = childAccess.isUserAllowedDiscount(of: .merchandise)
        
        print("Child Guest user \n \(childAccessArea.description) \n \(childAccessArea2.description) \n \(childAccessRide.description) \n \(childAccessDiscount.description) \n")
    */
        // --- Food Service Employee access
        // Testing: Can access Amusement Area?, Can access Kitchen? Can access Maintenance Area?, Skip all lines?, Merchandise discount?
    
        let foodServicesAccess = try FoodServices(NameAddress(firstName: "Fred", lastName: "Power", streetAddress: "Meadow Lane", city: "Glasgow", state: "Scotland", zipCode: "GL9 8YR", entrantType: .foodservices))
        let foodServicesAccessArea = foodServicesAccess.swipe(area: AreaAccess.amusement)
        let foodServicesAccessArea2 = foodServicesAccess.swipe(area: AreaAccess.kitchen)
        let foodServicesAccessArea3 = foodServicesAccess.swipe(area: AreaAccess.maintenance)
        let foodServicesAccessRide = foodServicesAccess.swipe(area: RideAccess.skipAllLines)
        let foodServicesAccessDiscount = foodServicesAccess.swipe(area: DiscountType.merchandise)
        
        print("Food Services Employee user \n \(foodServicesAccessArea.description) \n \(foodServicesAccessArea2.description) \n \(foodServicesAccessArea3.description) \n \(foodServicesAccessRide.description) \n \(foodServicesAccessDiscount.description) \n")
    
        // --- Ride Service Employee access
        // Testing: Can access Amusement Area?, Can access Ride Control? Can access Office Area?, Skip lines? food discount?
    /*
        let rideServicesAccess = try RideServices(NameAddress(firstName: "Fred", lastName: "Power", streetAddress: "Meadow Lane", city: "Glasgow", state: "Scotland", zipCode: "GL9 8YR", entrantType: .rideservices))
        let rideServicesAccessArea = rideServicesAccess.isUserAllowedInArea(.amusement)
        let rideServicesAccessArea2 = rideServicesAccess.isUserAllowedInArea(.ridecontrol)
        let rideServicesAccessArea3 = rideServicesAccess.isUserAllowedInArea(.office)
        let rideServicesAccessRide = rideServicesAccess.isUserAllowedInRide(.skipAllLines)
        let rideServicesAccessDiscount = rideServicesAccess.isUserAllowedDiscount(of: .food)
        
        print("Ride Services Employee user \n \(rideServicesAccessArea.description) \n \(rideServicesAccessArea2.description) \n \(rideServicesAccessArea3.description) \n \(rideServicesAccessRide.description) \n \(rideServicesAccessDiscount.description) \n")
    */
        // --- Maintenance Employee access
        // Testing: Can access Amusement Area?, Can access Maintenance? Can access Office Area?, Can access Ride Control? Skip lines? Merchandise discount?
    /*
        let maintenanceAccess = try Maintenance(NameAddress(firstName: "Fred", lastName: "Power", streetAddress: "Meadow Lane", city: "Glasgow", state: "Scotland", zipCode: "GL9 8YR", entrantType: .maintenance))
        let maintenanceAccessArea = maintenanceAccess.isUserAllowedInArea(.amusement)
        let maintenanceAccessArea2 = maintenanceAccess.isUserAllowedInArea(.maintenance)
        let maintenanceAccessArea3 = maintenanceAccess.isUserAllowedInArea(.office)
        let maintenanceAccessArea4 = maintenanceAccess.isUserAllowedInArea(.ridecontrol)
        let maintenanceAccessRide = maintenanceAccess.isUserAllowedInRide(.skipAllLines)
        let maintenanceAccessDiscount = maintenanceAccess.isUserAllowedDiscount(of: .merchandise)
        
        print("Maintenance Employee user \n \(maintenanceAccessArea.description) \n \(maintenanceAccessArea2.description) \n \(maintenanceAccessArea3.description) \n \(maintenanceAccessArea4.description) \n \(maintenanceAccessRide.description) \n \(maintenanceAccessDiscount.description) \n")
    */
            
            
        // --- Manager Employee access
        // Testing: Can access Amusement Area?, Can access Maintenance? Can access Office Area?, Can access Ride Control? Skip lines? Merchandise discount?
    /*
        let managerAccess = try Manager(NameAddress(firstName: "Fred", lastName: "Power", streetAddress: "Meadow Lane", city: "Glasgow", state: "Scotland", zipCode: "GL9 8YR", entrantType: .maintenance))
        let managerAccessArea = managerAccess.isUserAllowedInArea(.amusement)
        let managerAccessArea2 = managerAccess.isUserAllowedInArea(.maintenance)
        let managerAccessArea3 = managerAccess.isUserAllowedInArea(.office)
        let managerAccessArea4 = managerAccess.isUserAllowedInArea(.ridecontrol)
        let managerAccessRide = managerAccess.isUserAllowedInRide(.skipAllLines)
        let managerAccessDiscount = managerAccess.isUserAllowedDiscount(of: .merchandise)
        
        print("Manager Employee user \n \(managerAccessArea.description) \n \(managerAccessArea2.description) \n \(managerAccessArea3.description) \n \(managerAccessArea4.description) \n \(managerAccessRide.description) \n \(managerAccessDiscount.description) \n")
    */
        } catch InvalidNameAddressError.invalidDetails(errorDetails: let dataField, let user){
            print("Error: The \(dataField) field has no data for \(user.rawValue). Cannot create ticket for \(user.rawValue).")
        } catch InvalidAgeDataError.ageNotInAllowedRange(currentAge: let currentAge) {
            print("Error: Child is too old for Child Ticket, Child is \(currentAge) and needs to be under 5 for a Child ticket. Cannot create ticket.")
        } catch InvalidAgeDataError.missingBirthdayData {
            print("Error: Missing data in age")
        } catch InvalidAgeDataError.invalidAgeData {
            print("Error: invalid age format, must be in format dd/mm/yyyy")
        } catch let error {
            fatalError("\(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

