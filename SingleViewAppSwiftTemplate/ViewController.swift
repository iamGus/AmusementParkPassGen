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

class ViewController: UIViewController, UITextFieldDelegate {
   
    //Constraint for keyboard
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    //Menu StackView Outlets
    @IBOutlet weak var topMenubar: UIStackView!
    @IBOutlet weak var subMenuBlank: UIStackView!
    @IBOutlet weak var subMenuGuest: UIStackView!
    @IBOutlet weak var subMenuEmployee: UIStackView!
    @IBOutlet weak var subMenuContractor: UIStackView!
    @IBOutlet weak var subMenuVendor: UIStackView!
    
    //Top Menu ourlets
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
    
    //Contractor Sub Menu outlets
    @IBOutlet weak var subMenuContractor1001Button: UIButton!
    @IBOutlet weak var subMenuContractor1002Button: UIButton!
    @IBOutlet weak var subMenuContractor1003Button: UIButton!
    @IBOutlet weak var subMenuContractor2001Button: UIButton!
    @IBOutlet weak var subMenuContractor2002Button: UIButton!
    
    //Vendor Sub Menu outlets
    @IBOutlet weak var subMenuVendorAcmeButton: UIButton!
    @IBOutlet weak var subMenuVendorOrkinButton: UIButton!
    @IBOutlet weak var subMenuVendorFedexButton: UIButton!
    @IBOutlet weak var subMenuVendorNWElectricalButton: UIButton!
    
    //TextField outlets
    @IBOutlet weak var dobTextField: CustomTextField!
    @IBOutlet weak var dateVisitField: CustomTextField!
    @IBOutlet weak var projectTextField: CustomTextField!
    @IBOutlet weak var firstNameTextField: CustomTextField!
    @IBOutlet weak var lastNameTextField: CustomTextField!
    @IBOutlet weak var companyTextField: CustomTextField!
    @IBOutlet weak var streetAddressTextField: CustomTextField!
    @IBOutlet weak var cityTextField: CustomTextField!
    @IBOutlet weak var stateTextField: CustomTextField!
    @IBOutlet weak var zipCodeTextField: CustomTextField!
    
    //Label outlets
    @IBOutlet weak var dobLabel: CustomLabel!
    @IBOutlet weak var dateVisitLabel: CustomLabel!
    @IBOutlet weak var projectLabel: CustomLabel!
    @IBOutlet weak var firstNameLabel: CustomLabel!
    @IBOutlet weak var lastNameLabel: CustomLabel!
    @IBOutlet weak var companyLabel: CustomLabel!
    @IBOutlet weak var streetAddressLabel: CustomLabel!
    @IBOutlet weak var cityLabel: CustomLabel!
    @IBOutlet weak var stateLabel: CustomLabel!
    @IBOutlet weak var zipCodeLabel: CustomLabel!
    
 
    
    
    //Set properties
    var entrantSelected: EntrantType = .none
    var trackOfHighlightedTextField: [CustomTextField] = []
    var trackOfHighlightedLabel: [CustomLabel] = []
    
    
    
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
    
    private lazy var backgroundSubMenuContractorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 63/255, green: 54/255, blue: 71/255, alpha: 1)
        return view
    }()
    
    private lazy var backgroundSubMenuVendorView: UIView = {
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
        
        //Obervers for pushing up fields when keyboard is displayed
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard")))
        
        // delegate text fields so can set keyboard to close when return clicked
        firstNameTextField.delegate = self
        dobTextField.delegate = self
        dateVisitField.delegate = self
        projectTextField.delegate = self
        lastNameTextField.delegate = self
        companyTextField.delegate = self
        streetAddressTextField.delegate = self
        cityTextField.delegate = self
        stateTextField.delegate = self
        zipCodeTextField.delegate = self
        
        // Setting background coloyrs to meu bars
        pinBackground(backgroundTopMenuView, to: topMenubar)
        pinBackground(backgroundSubMenuGuestView, to: subMenuGuest)
        pinBackground(backgroundSubMenuBlankView, to: subMenuBlank)
        pinBackground(backgroundSubMenuEmployeeView, to: subMenuEmployee)
        pinBackground(backgroundSubMenuContractorView, to: subMenuContractor)
        pinBackground(backgroundSubMenuVendorView, to: subMenuVendor)
        
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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            if (endFrame?.origin.y)! >= UIScreen.main.bounds.size.height {
                self.keyboardHeightLayoutConstraint?.constant = 260.0
            } else {
                self.keyboardHeightLayoutConstraint?.constant = endFrame?.size.height ?? 0.0
            }
            UIView.animate(withDuration: duration,
                           delay: TimeInterval(0),
                           options: animationCurve,
                           animations: { self.view.layoutIfNeeded() },
                           completion: nil)
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
            subMenuVendor.isHidden = true
            subMenuContractor.isHidden = true
            
  
        } else if sender == employeeTopButton {
            subMenuBlank.isHidden = true
            subMenuGuest.isHidden = true
            subMenuContractor.isHidden = true
            subMenuVendor.isHidden = true
            subMenuEmployee.isHidden = false
            
  
        } else if sender == contractorTopButton {
            subMenuBlank.isHidden = true
            subMenuGuest.isHidden = true
            subMenuEmployee.isHidden = true
            subMenuVendor.isHidden = true
            subMenuContractor.isHidden = false
            
        } else if sender == vendorTopButton {
            subMenuBlank.isHidden = true
            subMenuGuest.isHidden = true
            subMenuEmployee.isHidden = true
            subMenuContractor.isHidden = true
            subMenuVendor.isHidden = false
        }
        
    }
    
    
    @IBAction func subMenuButtonPressed(_ sender: UIButton) {
        
        //reset submenu to inactive style
        subMenuReset()
        fieldsAndLabelReset()
        
        //set the button clicked to active style
        sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        sender.setTitleColor(UIColor.white, for: .normal)
        
        //Set current type of entrant selected inclusing active fields
        senderToCurrentEntrantState(buttonPressed: sender)
        print(entrantSelected)
    }
    
    
    // Date picker section - some DRY going on hear though not sure how to condense
    
            //Date picker for dob text field
            @IBAction func dobDatePicker(_ sender: CustomTextField) {
                let datePickerView = UIDatePicker()
                datePickerView.datePickerMode = .date
                sender.inputView = datePickerView
                datePickerView.addTarget(self, action: #selector(handleDobDatePicker(sender:)), for: .valueChanged)
            }
           // Handler for dob date picker
            func handleDobDatePicker(sender: UIDatePicker) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM / dd / YYYY"
                dobTextField.text = dateFormatter.string(from: sender.date)
                
            }
            
            //Date picker for visit text field
            @IBAction func dateOfVisitPicker(_ sender: CustomTextField) {
                //Enter todays date
                let todaysDate = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM / dd / YYYY"
                dateVisitField.text = dateFormatter.string(from: todaysDate)
                
                let datePickerView = UIDatePicker()
                datePickerView.datePickerMode = .date
                sender.inputView = datePickerView
                datePickerView.addTarget(self, action: #selector(handleVisitDatePicker(sender:)), for: .valueChanged)
            }
    
            // Handler for date of visit date picker
            func handleVisitDatePicker(sender: UIDatePicker) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM / dd / YYYY"
                dateVisitField.text = dateFormatter.string(from: sender.date)
                
            }
    
    
    
    //Set all sub menu button lables back to inactive state
    func subMenuReset() {
        let subMenuItems = [subMenuGuestChild, subMenuGuestAdult, subMenuGuestSenior, subMenuGuestVIP, subMenuGuestSeasonPass, subMenuEmployeeFoodButton, subMenuEmployeeRideButton, subMenuEmployeeMaintenanceButton, subMenuEmployeeManagerButton, subMenuContractor1001Button, subMenuContractor1002Button, subMenuContractor1003Button, subMenuContractor2001Button, subMenuContractor2002Button, subMenuVendorAcmeButton, subMenuVendorOrkinButton, subMenuVendorFedexButton, subMenuVendorNWElectricalButton]
        
        for eachButton in subMenuItems {
            eachButton?.titleLabel?.font = UIFont(name: "system", size: 17.0)
            eachButton?.setTitleColor(UIColor.init(red: 154/255, green: 133/255, blue: 178/255, alpha: 1), for: .normal)
        }
        
    }
    
    //NOTE should be able to remove the below reset funcs
    func subMenuGuestReset() {
         let subMenuItems = [subMenuGuestChild, subMenuGuestAdult, subMenuGuestSenior, subMenuGuestVIP, subMenuGuestSeasonPass]
        
         for eachButton in subMenuItems {
            eachButton?.titleLabel?.font = UIFont(name: "system", size: 17.0)
            eachButton?.setTitleColor(UIColor.init(red: 154/255, green: 133/255, blue: 178/255, alpha: 1), for: .normal)
        }
        
    }
    
    
    func subMenuEmployeeReset() {
        let subMenuItems = [subMenuEmployeeFoodButton, subMenuEmployeeRideButton, subMenuEmployeeMaintenanceButton, subMenuEmployeeManagerButton]
        
        for eachButton in subMenuItems {
            eachButton?.titleLabel?.font = UIFont(name: "system", size: 17.0)
            eachButton?.setTitleColor(UIColor.init(red: 154/255, green: 133/255, blue: 178/255, alpha: 1), for: .normal)
        }
        
    }
    
    func subMenuContractorReset() {
        let subMenuItems = [subMenuContractor1001Button, subMenuContractor1002Button, subMenuContractor1003Button, subMenuContractor2001Button, subMenuContractor2002Button]
        
        for eachButton in subMenuItems {
            eachButton?.titleLabel?.font = UIFont(name: "system", size: 17.0)
            eachButton?.setTitleColor(UIColor.init(red: 154/255, green: 133/255, blue: 178/255, alpha: 1), for: .normal)
        }
        
    }
    
    func setActiveInterface(textField: [CustomTextField], label: [CustomLabel]) {
        for eachButton in textField {
            eachButton.isEnabled = true
        }
        
        for eachLabel in label {
            eachLabel.textColor = UIColor.black
        }
        
        trackOfHighlightedTextField = textField
        trackOfHighlightedLabel = label
        print(trackOfHighlightedTextField)
    }
    
  
    
    func fieldsAndLabelReset() {
        
        if projectTextField.text != "" {
            projectTextField.text = ""
            projectTextField.placeholder = "########"
        }
        
        if trackOfHighlightedTextField != [] {
            for eachButton in trackOfHighlightedTextField {
                eachButton.isEnabled = false
            }
        }
        
        if trackOfHighlightedLabel != [] {
            for eachLabel in trackOfHighlightedLabel {
                eachLabel.textColor = UIColor.lightGray
            }
        }
    }
    
    func projectFieldActivate(project: String) {
        projectLabel.textColor = UIColor.black
        projectTextField.isEnabled = true
        projectTextField.text = project
        trackOfHighlightedTextField.append(projectTextField)
        trackOfHighlightedLabel.append(projectLabel)
    }
    
    func senderToCurrentEntrantState(buttonPressed: UIButton) {
        switch buttonPressed {
        case subMenuGuestChild: entrantSelected = .freechildguest; setActiveInterface(textField: [dobTextField], label: [dobLabel])
        case subMenuGuestAdult: entrantSelected = .classicguest
        case subMenuGuestSenior: entrantSelected = .seniorguest; setActiveInterface(textField: [dobTextField, firstNameTextField, lastNameTextField], label: [dobLabel, firstNameLabel, lastNameLabel])
        case subMenuGuestVIP: entrantSelected = .vipguest
        case subMenuGuestSeasonPass: entrantSelected = .seasonguest; setActiveInterface(textField: [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipCodeTextField], label: [firstNameLabel, lastNameLabel, streetAddressLabel, cityLabel, stateLabel, zipCodeLabel])
        case subMenuEmployeeFoodButton: entrantSelected = .foodservices; setActiveInterface(textField: [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipCodeTextField], label: [firstNameLabel, lastNameLabel, streetAddressLabel, cityLabel, stateLabel, zipCodeLabel])
        case subMenuEmployeeRideButton: entrantSelected = .rideservices; setActiveInterface(textField: [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipCodeTextField], label: [firstNameLabel, lastNameLabel, streetAddressLabel, cityLabel, stateLabel, zipCodeLabel])
        case subMenuEmployeeMaintenanceButton: entrantSelected = .maintenance; setActiveInterface(textField: [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipCodeTextField], label: [firstNameLabel, lastNameLabel, streetAddressLabel, cityLabel, stateLabel, zipCodeLabel])
        case subMenuEmployeeManagerButton: entrantSelected = .manager; setActiveInterface(textField: [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipCodeTextField], label: [firstNameLabel, lastNameLabel, streetAddressLabel, cityLabel, stateLabel, zipCodeLabel])
        case subMenuContractor1001Button: entrantSelected = .contract1001; setActiveInterface(textField: [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipCodeTextField], label: [firstNameLabel, lastNameLabel, streetAddressLabel, cityLabel, stateLabel, zipCodeLabel]); projectFieldActivate(project: "1001")
        case subMenuContractor1002Button: entrantSelected = .contract1002; setActiveInterface(textField: [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipCodeTextField], label: [firstNameLabel, lastNameLabel, streetAddressLabel, cityLabel, stateLabel, zipCodeLabel]); projectFieldActivate(project: "1002")
        case subMenuContractor1003Button: entrantSelected = .contract1003; setActiveInterface(textField: [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipCodeTextField], label: [firstNameLabel, lastNameLabel, streetAddressLabel, cityLabel, stateLabel, zipCodeLabel]); projectFieldActivate(project: "1003")
        case subMenuContractor2001Button: entrantSelected = .contract2001; setActiveInterface(textField: [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipCodeTextField], label: [firstNameLabel, lastNameLabel, streetAddressLabel, cityLabel, stateLabel, zipCodeLabel]); projectFieldActivate(project: "2001")
        case subMenuContractor2002Button: entrantSelected = .contract2002; setActiveInterface(textField: [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipCodeTextField], label: [firstNameLabel, lastNameLabel, streetAddressLabel, cityLabel, stateLabel, zipCodeLabel]); projectFieldActivate(project: "2002")
        case subMenuVendorAcmeButton: entrantSelected = .vendoracme; setActiveInterface(textField: [dobTextField, dateVisitField, firstNameTextField, lastNameTextField, companyTextField], label: [dobLabel, dateVisitLabel, firstNameLabel, lastNameLabel, companyLabel])
        case subMenuVendorOrkinButton: entrantSelected = .vendororkin; setActiveInterface(textField: [dobTextField, dateVisitField, firstNameTextField, lastNameTextField, companyTextField], label: [dobLabel, dateVisitLabel, firstNameLabel, lastNameLabel, companyLabel])
        case subMenuVendorFedexButton: entrantSelected = .vendorfedex; setActiveInterface(textField: [dobTextField, dateVisitField, firstNameTextField, lastNameTextField, companyTextField], label: [dobLabel, dateVisitLabel, firstNameLabel, lastNameLabel, companyLabel])
        case subMenuVendorNWElectricalButton: entrantSelected = .vendorneweletrical; setActiveInterface(textField: [dobTextField, dateVisitField, firstNameTextField, lastNameTextField, companyTextField], label: [dobLabel, dateVisitLabel, firstNameLabel, lastNameLabel, companyLabel])
        default: entrantSelected = .none
        }
    }
    
    // Used when user touches outside textfield to close keyboard
    func dismissKeyboard() {
        firstNameTextField.resignFirstResponder()
        dobTextField.resignFirstResponder()
        dateVisitField.resignFirstResponder()
        projectTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        companyTextField.resignFirstResponder()
        streetAddressTextField.resignFirstResponder()
        cityTextField.resignFirstResponder()
        stateTextField.resignFirstResponder()
        zipCodeTextField.resignFirstResponder()
    }
    
    // To close keyboard when user presses return on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    

}

