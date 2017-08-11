//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Angus Muller on 03/07/2017.
//  Copyright © 2017 Angus Muller. All rights reserved.
//

import UIKit

// Extension to pin background to stackview edges for top menu bar
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
    
    //Top Menu outlets
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
    var entrantSelected: EntrantType = .none // Keeping track of active entrant selected
    var trackOfHighlightedTextField: [CustomTextField] = [] // Keeping track of which textfields were last activated
    var trackOfHighlightedLabel: [CustomLabel] = [] // Keeping track of which labels were last activated
    var entrantData: People? //When a entrant is generated (successful instance of entrant created) data is stored here ready to be transferred to ticket view
    
    
    
    // Create a view that will be the Top menu background colour
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
  
    
    // Pinning the background to stackview at index 0 of stackview subview array
    private func pinBackground(_ view: UIView, to stackView: UIStackView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        stackView.insertSubview(view, at: 0)
        view.pin(to: stackView)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Keyboard display and remove
        
            //Observers for keyboard appearing and hiding
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
            //If user touches screen when keyboard shown
            self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard)))
            
            
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
        
        // Setting background colors to menu bars
        pinBackground(backgroundTopMenuView, to: topMenubar)
        pinBackground(backgroundSubMenuGuestView, to: subMenuGuest)
        pinBackground(backgroundSubMenuBlankView, to: subMenuBlank)
        pinBackground(backgroundSubMenuEmployeeView, to: subMenuEmployee)
        pinBackground(backgroundSubMenuContractorView, to: subMenuContractor)
        pinBackground(backgroundSubMenuVendorView, to: subMenuVendor)
       
    }
    

 
    //MARK: Keyboard - all related code to keyboard functions
    
        // Removing keyboard observer
        
        deinit {
            NotificationCenter.default.removeObserver(self)
        }
    
        //Additional keyboard setup including adding constraints so main form content is pushed up when keyboard shows/hides
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

    //MARK: IBActions
    
        //MARK: Top menu and Sub Menu
    
        //Top Menu - set button style depending which top menu button clicked and also show sub menu
        @IBAction func topMenuButtons(_ sender: UIButton) {
            let topMenuItems = [guestTopButton, employeeTopButton, contractorTopButton, vendorTopButton] // Create array of all top menu buttons so can iterate through them.
            
            //Set all menu items to inactive style, so if previous top button clicked, will be reset to inactive state
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
        
        //Sub menu style set depending on which button clicked
        @IBAction func subMenuButtonPressed(_ sender: UIButton) {
            
            //reset submenu to inactive style
            subMenuReset() // Set all buttons on sub menu to inactive state
            fieldsAndLabelReset() // Set all fields and labels in form to inactive
            
            //set the button clicked to active style
            sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
            sender.setTitleColor(UIColor.white, for: .normal)
            
            //Set current type of entrant selected including make relevant fields and labels active
            senderToCurrentEntrantState(buttonPressed: sender)
            print(entrantSelected) // For testing
        }
    
    
    // Date picker for the two date fields
    
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
    
    // Generate Pass button - entrants data is checked to see if it conforms to needed rules
    @IBAction func generatePass(_ sender: UIButton) {
        
        do{
            // Switch to the current entrant selected (done in senderToCurrentEntrantSate) and try and create instance of that entrant
            switch entrantSelected {
            case .freechildguest: entrantData = try Child(dateOfBirth: "\(dobTextField.text!)")
            case .classicguest: entrantData = ClassicGuest()
            case .seniorguest: entrantData = try SeniorGuest(firstName: firstNameTextField.text, lastName: lastNameTextField.text, entrantType: .seniorguest, dateOfBirth: dobTextField.text!)
            case .vipguest: entrantData = VIPGuest()
            case .seasonguest: entrantData = try SeasonGuest(NameAddress(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, entrantType: .seasonguest))
            case .foodservices: entrantData = try FoodServices(NameAddress(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, entrantType: .foodservices))
            case .rideservices: entrantData = try RideServices(NameAddress(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, entrantType: .rideservices))
            case .maintenance: entrantData = try Maintenance(NameAddress(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, entrantType: .maintenance))
            case .manager: entrantData = try Manager(NameAddress(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, entrantType: .manager))
            case .contract1001: entrantData = try ContractEmployee1001(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, entrantType: .contract1001, projectNumber: projectTextField.text)
            case .contract1002: entrantData = try ContractEmployee1002(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, entrantType: .contract1002, projectNumber: projectTextField.text)
            case .contract1003: entrantData = try ContractEmployee1003(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, entrantType: .contract1003, projectNumber: projectTextField.text)
            case .contract2001: entrantData = try ContractEmployee2001(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, entrantType: .contract2001, projectNumber: projectTextField.text)
            case .contract2002: entrantData = try ContractEmployee2002(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, entrantType: .contract2002, projectNumber: projectTextField.text)
            case .vendoracme: entrantData = try VendorAcme(firstName: firstNameTextField.text, lastName: lastNameTextField.text, entrantType: .vendoracme, dateOfBirth: dobTextField.text!, company: companyTextField.text, dateOfVisit: dateVisitField.text!)
            case .vendororkin: entrantData = try VendorOrkin(firstName: firstNameTextField.text, lastName: lastNameTextField.text, entrantType: .vendororkin, dateOfBirth: dobTextField.text!, company: companyTextField.text, dateOfVisit: dateVisitField.text!)
            case .vendorfedex: entrantData = try VendorFedex(firstName: firstNameTextField.text, lastName: lastNameTextField.text, entrantType: .vendorfedex, dateOfBirth: dobTextField.text!, company: companyTextField.text, dateOfVisit: dateVisitField.text!)
            case .vendornwelectrical: entrantData = try VendorNWElectrical(firstName: firstNameTextField.text, lastName: lastNameTextField.text, entrantType: .vendornwelectrical, dateOfBirth: dobTextField.text!, company: companyTextField.text, dateOfVisit: dateVisitField.text!)
            default: break // No user selected error handling is dealt in prepare for segue function. See below.
                
            }
            
        // Error handling for incomplete or wrong data in form
            
        } catch InvalidNameAddressError.invalidDetails(errorDetails: let dataField, let user){
            showAlert(title: "Error missing data", message: "The \(dataField) field has no data. Cannot create ticket")
            print("The \(dataField) field has no data for \(user.rawValue). Cannot create ticket for \(user.rawValue).")
        } catch InvalidAgeDataError.ageNotInAllowedRange(currentAge: let currentAge) {
            showAlert(title: "Cannot create ticket", message: "Child is too old for Child Ticket, Child is \(currentAge) and needs to be under 5 for a Child ticket.")
            print("Error: Child is too old for Child Ticket, Child is \(currentAge) and needs to be under 5 for a Child ticket. Cannot create ticket.")
        } catch InvalidAgeDataError.missingBirthdayData {
            showAlert(title: "Cannot create ticket", message: "You have not provided a date")
            print("Error: You have not provided a date")
        } catch InvalidAgeDataError.invalidAgeData {
            showAlert(title: "Cannot create ticket", message: "Invalid date format, date must be in the format of MM / DD / YYYY")
            print("Error: invalid date format, must be in the format of MM / DD / YYYY")
        } catch InvalidNameAddressError.invalidCompanyName {
            showAlert(title: "Error missing data", message: "The company name field has no data. Cannot create ticket.")
        } catch InvalidNameAddressError.invalidProjectNumber {
            showAlert(title: "Error missing data", message: "The Project Number field has no data. Cannot create ticket.")
        } catch let error {
            showAlert(title: "Error", message: "\(error)")
        }
        
    
    }
    
    // Passing current entrant form data to ticket view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dataToPassToTicketView = entrantData {
            if let destViewController = segue.destination as? TicketViewController {
                destViewController.dataFromForm = dataToPassToTicketView
            }
        } else {
            // If users clicks on generate ticket then segue tries to happen but if entrant data is nill it means no user type has been generated and so user has not selected an entrant type. Error message then shows and segue does not happen.
            showAlert(title: "Error", message: "No user selected")
        }
    }
    
    // Populate data button - depending on entrant selected it populates relevant fields with pre-set data.
    @IBAction func populateData(_ sender: UIButton) {
        
        switch entrantSelected {
        case .freechildguest: dobTextField.text = "08 / 27 / 2016"
        case .classicguest, .vipguest: break
        case .seniorguest: dobTextField.text = "12 / 14 / 1946"; firstNameTextField.text = "Howard"; lastNameTextField.text = "Smith"
        case .seasonguest, .foodservices, .rideservices, .maintenance, .manager, .contract1001, .contract1002, .contract1003, .contract2001, .contract2002: firstNameTextField.text = "Howard"; lastNameTextField.text = "Smith"; streetAddressTextField.text = "12 Upper Way"; cityTextField.text = "Inverness"; stateTextField.text = "Inverness-shire"; zipCodeTextField.text = "IV4 8HE"
        case .vendoracme, .vendororkin, .vendorfedex, .vendornwelectrical: dobTextField.text = "12 / 14 / 1979"; dateVisitField.text = "08 / 08 / 2017"; firstNameTextField.text = "Howard"; lastNameTextField.text = "Smith"; companyTextField.text = entrantSelected.rawValue
        default: showAlert(title: "Error", message: "No user selected")
        }
        
    }
    
    // Generic alert pop up function used for all error handling notifications
    func showAlert(title: String, message: String, style: UIAlertControllerStyle = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
 
    
    //Set all sub menu button labels back to inactive state
    func subMenuReset() {
        let subMenuItems = [subMenuGuestChild, subMenuGuestAdult, subMenuGuestSenior, subMenuGuestVIP, subMenuGuestSeasonPass, subMenuEmployeeFoodButton, subMenuEmployeeRideButton, subMenuEmployeeMaintenanceButton, subMenuEmployeeManagerButton, subMenuContractor1001Button, subMenuContractor1002Button, subMenuContractor1003Button, subMenuContractor2001Button, subMenuContractor2002Button, subMenuVendorAcmeButton, subMenuVendorOrkinButton, subMenuVendorFedexButton, subMenuVendorNWElectricalButton]
        
        for eachButton in subMenuItems {
            eachButton?.titleLabel?.font = UIFont(name: "system", size: 17.0)
            eachButton?.setTitleColor(UIColor.init(red: 154/255, green: 133/255, blue: 178/255, alpha: 1), for: .normal)
        }
        
    }
    
    //When called to set given textfield and labels to active state
    func setActiveInterface(textField: [CustomTextField], label: [CustomLabel]) {
        // Go through each textfield and label given to it and set to active state / style
        for eachTextField in textField {
            eachTextField.isEnabled = true
        }
        
        for eachLabel in label {
            eachLabel.textColor = UIColor.black
        }
        
        //Record which fields and labels have been activated. So can be used in fieldsAndLabelReset() to reset to inactive state
        trackOfHighlightedTextField = textField
        trackOfHighlightedLabel = label
    }
    
  
    //When a user clicks onto a different entrant type to reset text field to blank and disabled, set labels to disabled.
    func fieldsAndLabelReset() {
        
        //If project field has data
        if projectTextField.text != "" {
            projectTextField.text = ""
            projectTextField.placeholder = "########"
        }
        
        if trackOfHighlightedTextField != [] { // If there are active text fields then reset
            for eachTextField in trackOfHighlightedTextField {
                eachTextField.isEnabled = false
                eachTextField.text = ""
                
            }
        }
        
        if trackOfHighlightedLabel != [] { //If there are active labels then reset
            for eachLabel in trackOfHighlightedLabel {
                eachLabel.textColor = UIColor.lightGray
            }
        }
    }
    
    // Set project field to active state and insert project number into field. This func called from within senderToCurrentEntrantState()
    func projectFieldActivate(project: String) {
        projectLabel.textColor = UIColor.black
        projectTextField.isEnabled = true
        projectTextField.text = project
        trackOfHighlightedTextField.append(projectTextField)
        trackOfHighlightedLabel.append(projectLabel)
    }
    
    // To set textfields and labels to activate state depending on which sub menu button pressed. Called from subMenuButtonPressed IBAction
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
        case subMenuVendorNWElectricalButton: entrantSelected = .vendornwelectrical; setActiveInterface(textField: [dobTextField, dateVisitField, firstNameTextField, lastNameTextField, companyTextField], label: [dobLabel, dateVisitLabel, firstNameLabel, lastNameLabel, companyLabel])
        default: entrantSelected = .none
        }
    }
    

}

