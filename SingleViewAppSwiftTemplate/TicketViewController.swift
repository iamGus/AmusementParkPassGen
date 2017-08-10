//
//  TicketViewController.swift
//  AmusementPassPart1
//
//  Created by Angus Muller on 09/08/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import Foundation

class TicketViewController: UIViewController {
    
    @IBOutlet weak var areaAccessButton: UIButton!
    
    @IBOutlet weak var rideAccessButton: UIButton!
    
    @IBOutlet weak var discountAccessButton: UIButton!
    
    
    //Label outlets
    @IBOutlet weak var firstAndLastNameLabel: UILabel!
    @IBOutlet weak var entrantTypeLabel: UILabel!
    @IBOutlet weak var bullitPointOne: UILabel!
    @IBOutlet weak var bullitPointTwo: UILabel!
    @IBOutlet weak var bullitPointThree: UILabel!
    @IBOutlet weak var testResultsLabel: UILabel!
    
    
    var dataFromForm: People = People()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dataFromForm.swipe(area: AreaAccess.amusement)
     //   guard let var newdata = dataFromForm as! ClassicGuest
        
        //bullitPointOne.text = "\u{2022} This is a list item!"
   print(dataFromForm)
        
        setTicketDetailsUp()
      
      
    }
    
    //Works out what type of Entrant user is and then displays corerct data onto ticket
    func setTicketDetailsUp() {
        entrantTypeLabel.text = dataFromForm.entrantType.rawValue // as entrantType is in People Type access this value now and add to label
        
        //Now check what subclass the entrant is so can access its properties
        if let freeChildGuest = dataFromForm as? Child {
            firstAndLastNameLabel.text = "Guest Entrant"
            
        } else if let classicGuest = dataFromForm as? ClassicGuest {
            firstAndLastNameLabel.text = "Guest Entrant"
            
        } else if let seniorGuest = dataFromForm as? SeniorGuest {
            firstAndLastNameLabel.text = seniorGuest.nameAddress.fullName
            
        } else if let vipGuest = dataFromForm as? VIPGuest {
            firstAndLastNameLabel.text = "Guest Entrant"
            
        } else if let seasonGuest = dataFromForm as? SeasonGuest {
            firstAndLastNameLabel.text = seasonGuest.nameAddress.fullName
            
        } else if let foodServicesEmployee = dataFromForm as? FoodServices {
            firstAndLastNameLabel.text = foodServicesEmployee.nameAddress.fullName
            
        } else if let rideServicesEmployee = dataFromForm as? RideServices {
            firstAndLastNameLabel.text = rideServicesEmployee.nameAddress.fullName
            
        } else if let maintenanceServicesEmployee = dataFromForm as? Maintenance {
            firstAndLastNameLabel.text = maintenanceServicesEmployee.nameAddress.fullName
            
        } else if let managerEmployee = dataFromForm as? Manager {
            firstAndLastNameLabel.text = managerEmployee.nameAddress.fullName
            
        } else if let contract1001 = dataFromForm as? ContractEmployee1001 {
            firstAndLastNameLabel.text = contract1001.nameAddress.fullName
            
        } else if let contract1002 = dataFromForm as? ContractEmployee1002 {
            firstAndLastNameLabel.text = contract1002.nameAddress.fullName
            
        } else if let contract1003 = dataFromForm as? ContractEmployee1003 {
            firstAndLastNameLabel.text = contract1003.nameAddress.fullName
            
        } else if let contract2001 = dataFromForm as? ContractEmployee2001 {
            firstAndLastNameLabel.text = contract2001.nameAddress.fullName
            
        } else if let contract2002 = dataFromForm as? ContractEmployee2002 {
            firstAndLastNameLabel.text = contract2002.nameAddress.fullName
            
        } else if let vendorAcme = dataFromForm as? VendorAcme {
            firstAndLastNameLabel.text = vendorAcme.nameAddress.fullName
            
        } else if let vendorOrkin = dataFromForm as? VendorOrkin {
            firstAndLastNameLabel.text = vendorOrkin.nameAddress.fullName
            
        } else if let vendorFedex = dataFromForm as? VendorFedex {
            firstAndLastNameLabel.text = vendorFedex.nameAddress.fullName
            
        } else if let vendorNWElectrical = dataFromForm as? VendorNWElectrical {
            firstAndLastNameLabel.text = vendorNWElectrical.nameAddress.fullName
            
        } else {
            //add error if it cannot find type
        }
        
        // Check wheather entrant can access rodes and update first bullit point on ticket
        for rideAccessCheck in dataFromForm.rideAccess {
            switch rideAccessCheck {
            case .allrides: bullitPointOne.text = "\u{2022} Access All Rides"
            default: bullitPointOne.text = "\u{2022} Access to Rides not Allowed"
            }
        }
        
        // Display food discount on ticket
        bullitPointTwo.text = "\u{2022} \(dataFromForm.discountAccess.food.rawValue)"
        
        // Display merchant discount on ticket
        bullitPointThree.text = "\u{2022} \(dataFromForm.discountAccess.merchendise.rawValue)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func accessTestingButtons(_ sender: UIButton) {
        if sender == areaAccessButton {
            testResultsLabel.textColor = UIColor.black
            testResultsLabel.text = " \(dataFromForm.swipe(area: AreaAccess.amusement).description) \n \(dataFromForm.swipe(area: AreaAccess.kitchen).description) \n \(dataFromForm.swipe(area: AreaAccess.ridecontrol).description) \n \(dataFromForm.swipe(area: AreaAccess.maintenance).description) \n \(dataFromForm.swipe(area: AreaAccess.office).description)"
        } else if sender == rideAccessButton {
            testResultsLabel.textColor = UIColor.black
            testResultsLabel.text = " \(dataFromForm.swipe(area: RideAccess.allrides).description) \n \(dataFromForm.swipe(area: RideAccess.skipAllLines).description)"
        } else if sender == discountAccessButton {
            testResultsLabel.textColor = UIColor.black
            testResultsLabel.text = " \(dataFromForm.swipe(area: DiscountType.food).description) \n \(dataFromForm.swipe(area: DiscountType.merchandise).description)"
        }
    }
    
 
    

}
