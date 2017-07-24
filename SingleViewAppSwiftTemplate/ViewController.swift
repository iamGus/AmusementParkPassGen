//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Angus Muller on 03/07/2017.
//  Copyright © 2017 Angus Muller. All rights reserved.
//

import UIKit

// Extension to help pin background to stackview edges for top meny bar
public extension UIView {
    public func pin(to view: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

class ViewController: UIViewController {
   
    //Outlets
    @IBOutlet weak var topMenubar: UIStackView!
    @IBOutlet weak var subMenuBlank: UIStackView!
    @IBOutlet weak var subMenuGuest: UIStackView!
    @IBOutlet weak var subMenuEmployee: UIStackView!
    
    @IBOutlet weak var guestTopButton: UIButton!
    @IBOutlet weak var employeeTopButton: UIButton!
    @IBOutlet weak var contractorTopButton: UIButton!
    @IBOutlet weak var vendorTopButton: UIButton!
    
    //Guest Sub Menu outlets
    @IBOutlet weak var subMenuGuestChild: UIButton!
    @IBOutlet weak var subMenuGuestAdult: UIButton!
    @IBOutlet weak var subMenuGuestSenior: UIButton!
    @IBOutlet weak var subMenuGuestVIP: UIButton!
    @IBOutlet weak var subMenuGuestSeasonPass: UIButton!
    
    //Employee Sub Menu outlets
    @IBOutlet weak var subMenuEmployeeFoodButton: UIButton!
    @IBOutlet weak var subMenuEmployeeRideButton: UIButton!
    @IBOutlet weak var subMenuEmployeeMaintenanceButton: UIButton!
    @IBOutlet weak var subMenuEmployeeManagerButton: UIButton!
    
    var entrantSelected: EntrantType = .none
    
    
    // Create a view that will be the Top meny background colour
    private lazy var backgroundTopMenuView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 139/255, green: 109/255, blue: 169/255, alpha: 1)
        return view
    }()
    
    
    
    private lazy var backgroundSubMenuBlankView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 63/255, green: 54/255, blue: 71/255, alpha: 1)
        return view
    }()
    
    private lazy var backgroundSubMenuGuestView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 63/255, green: 54/255, blue: 71/255, alpha: 1)
        return view
    }()
    
    private lazy var backgroundSubMenuEmployeeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 63/255, green: 54/255, blue: 71/255, alpha: 1)
        return view
    }()
  
    
    // Pinning the background to stackview at index 0 of stackview sunview array
    private func pinBackground(_ view: UIView, to stackView: UIStackView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        stackView.insertSubview(view, at: 0)
        view.pin(to: stackView)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Setting background coloyrs to meu bars
        pinBackground(backgroundTopMenuView, to: topMenubar)
        pinBackground(backgroundSubMenuGuestView, to: subMenuGuest)
        pinBackground(backgroundSubMenuBlankView, to: subMenuBlank)
        pinBackground(backgroundSubMenuEmployeeView, to: subMenuEmployee)
        
        
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

             //---- Child with wrong birthday format ----
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
           
            let vendor = try VendorAcme(firstName: "Gus", lastName: "Muller", entrantType: .vendoracme, dateOfBirth: "12/05/1976", company: "Acme", dateOfVisit: "21/06/2017")
            
            print("dob: \(vendor.dob) address: \(vendor.nameAddress.fullName)")
            
            let seniorGuest = try SeniorGuest(firstName: "Angus", lastName: "Muller", entrantType: .seniorguest, dateOfBirth: "08/03/1943")
            
            print("\(seniorGuest.nameAddress.fullName)")
            
            let contract = try ContractEmployee1001(NameAddress(firstName: "Gus", lastName: "Muller", streetAddress: "Street", city: "City", state: "state", zipCode: "BS8HSG", entrantType: .contract1001))
            
            print(contract.rideAccess)
            
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
        } catch InvalidNameAddressError.invalidCompanyName {
            print("Error: Missing Company Name")
        } catch let error {
            fatalError("\(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func topMenuButtons(_ sender: UIButton) {
        let topMenuItems = [guestTopButton, employeeTopButton, contractorTopButton, vendorTopButton]
        
        //Set all menu items to inactive style
        for eachButton in topMenuItems {
            eachButton?.titleLabel?.font = UIFont(name: "system", size: 20.0)
            eachButton?.setTitleColor(UIColor.init(red: 206/255, green: 162/255, blue: 255/255, alpha: 1), for: .normal)
        }
        
        //set the button clicked to active style
        sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        sender.setTitleColor(UIColor.white, for: .normal)
        
        //show the sub menu for the button clicked and hide other sub menu
        if sender == guestTopButton {
            subMenuBlank.isHidden = true
            subMenuEmployee.isHidden = true
            subMenuGuest.isHidden = false
            
            //reset submenu to inactive style
            subMenuGuestReset()
        } else if sender == employeeTopButton {
            subMenuBlank.isHidden = true
            subMenuGuest.isHidden = true
            subMenuEmployee.isHidden = false
            
            //reset submenu to inactive style
            subMenuEmployeeReset()
        }
        
    }
    
    
    @IBAction func subMenuGuestButtons(_ sender: UIButton) {
        
        //reset submenu to inactive style
        subMenuGuestReset()
        
        //set the button clicked to active style
        sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        sender.setTitleColor(UIColor.white, for: .normal)
        
        //Set current type of entrant selected
        senderToCurrentEntrantState(buttonPressed: sender)
        
    }
    
    @IBAction func subMenuEmployeeButtons(_ sender: UIButton) {
        //reset submenu to inactive style
        subMenuEmployeeReset()
        
        //set the button clicked to active style
        sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        sender.setTitleColor(UIColor.white, for: .normal)
        
        //Set current type of entrant selected
        senderToCurrentEntrantState(buttonPressed: sender)
    }
    
    
    
    func subMenuGuestReset() {
         let subMenuGuestItems = [subMenuGuestChild, subMenuGuestAdult, subMenuGuestSenior, subMenuGuestVIP, subMenuGuestSeasonPass]
        
         for eachButton in subMenuGuestItems {
            eachButton?.titleLabel?.font = UIFont(name: "system", size: 17.0)
            eachButton?.setTitleColor(UIColor.init(red: 154/255, green: 133/255, blue: 178/255, alpha: 1), for: .normal)
        }
        
    }
    
    
    func subMenuEmployeeReset() {
        let subMenuGuestItems = [subMenuEmployeeFoodButton, subMenuEmployeeRideButton, subMenuEmployeeMaintenanceButton, subMenuEmployeeManagerButton]
        
        for eachButton in subMenuGuestItems {
            eachButton?.titleLabel?.font = UIFont(name: "system", size: 17.0)
            eachButton?.setTitleColor(UIColor.init(red: 154/255, green: 133/255, blue: 178/255, alpha: 1), for: .normal)
        }
        
    }
    
    func senderToCurrentEntrantState(buttonPressed: UIButton) {
        switch buttonPressed {
        case subMenuGuestChild: entrantSelected = .freechildguest
        case subMenuGuestAdult: entrantSelected = .classicguest
        case subMenuGuestSenior: entrantSelected = .seniorguest
        case subMenuGuestVIP: entrantSelected = .vipguest
        case subMenuGuestSeasonPass: entrantSelected = .seasonguest
        case subMenuEmployeeFoodButton: entrantSelected = .foodservices
        case subMenuEmployeeRideButton: entrantSelected = .rideservices
        case subMenuEmployeeMaintenanceButton: entrantSelected = .maintenance
        case subMenuEmployeeManagerButton: entrantSelected = .manager
        default: entrantSelected = .none
        }
    }
    

}

