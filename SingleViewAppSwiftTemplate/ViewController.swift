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
        
        
        do{
            let bob = try FoodServices(nameAddress: NameAddress(firstName: "jsj", lastName: "Muller", streetAddress: "street 1", city: "London", state: "", zipCode: "PO9 8HT"))
            
            //let bill = try NameAddress(firstName: nil, lastName: "ss", streetAddress: "ss", city: "ss", state: "ss", zipCode: "dd")
            
            print(bob.nameAddress.firstName)
           // print(bill.firstName)
            
        } catch InvalidNameAddressError.invalidDetails(errorDetails: let data){
            print("The \(data) field has invalid data")
        } catch let error {
            fatalError("\(error)")
        }
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

