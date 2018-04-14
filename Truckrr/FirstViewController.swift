//
//  FirstViewController.swift
//  Truckrr
//
//  Created by Drew Patel on 4/13/18.
//  Copyright © 2018 Drew Patel. All rights reserved.
//

import UIKit
import Eureka

class FirstViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        form +++ Section("General Information")
            <<< NameRow("Name"){ row in
                row.title = "Name of Good"
                row.placeholder = "Lobster"
            }
            <<< TextRow("Description"){ row in
                row.title = "Description"
                row.placeholder = "It has claws."
            }
            <<< DateRow(){
                $0.title = "Arrive by Date"
                $0.value = Date()
            }
            <<< TextRow("Description"){ row in
                row.title = "Description"
                row.placeholder = "It has claws."
            }
            
            +++ Section("Dimensions & Weight")
            <<< IntRow("Length"){ row in
                row.title = "Length (in.)"
                row.placeholder = "10"
            }
            <<< IntRow("Width"){ row in
                row.title = "Width (in.)"
                row.placeholder = "10"
            }
            <<< IntRow("Height"){ row in
                row.title = "Height (in.)"
                row.placeholder = "10"
            }
            <<< IntRow("Weight"){ row in
                row.title = "Weight (oz.)"
                row.placeholder = "16"
            }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

