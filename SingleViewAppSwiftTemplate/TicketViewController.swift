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
    
    var dataFromForm: People = People()
    var entrantType: EntrantType = .none

    override func viewDidLoad() {
        super.viewDidLoad()
        dataFromForm.swipe(area: AreaAccess.amusement)
     //   guard let var newdata = dataFromForm as! ClassicGuest
        
        
   print(dataFromForm)
        
       // print(newdata.discountAccess.food)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
