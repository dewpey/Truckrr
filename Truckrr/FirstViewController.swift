//
//  FirstViewController.swift
//  Truckrr
//
//  Created by Drew Patel on 4/13/18.
//  Copyright © 2018 Drew Patel. All rights reserved.
//

import UIKit
import Eureka
import GooglePlacesRow
class FirstViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        form +++ Section("General Information")
            <<< NameRow("Name"){ row in
                row.title = "Name of Good"
                row.placeholder = "Lobster"
            }
           /* <<< TextRow("Description"){ row in
                row.title = "Description"
                row.placeholder = "It has claws."
            } */
            <<< DateRow(){
                $0.title = "Pickup Date"
                $0.value = Date()
            }
            <<< DateRow(){
                $0.title = "Desired Delivery Date"
                $0.value = Date()
            }
        form +++
            MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
                               header: "Description of item",
                               footer: ".Insert adds a 'Add Item' (Add New Tag) button row as last cell.") {
                                $0.addButtonProvider = { section in
                                    return ButtonRow(){
                                        $0.title = "Property"
                                    }
                                }
                                $0.multivaluedRowToInsertAt = { index in
                                    return NameRow() {
                                        $0.placeholder = "Property"
                                    }
                                }
                                $0 <<< NameRow() {
                                    $0.placeholder = "Important Extra Information"
                                }
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
            <<< AlertRow<String>("bloodType") {
                $0.title = "Is Object Fragile"
                $0.selectorTitle = "Fragile"
                $0.options = ["Fragile", "Not Fragile"]
                $0.value = "Fragile"    // initially selected
                
            }
            <<< GooglePlacesTableRow("Origin") { row in
                row.title = "Origin" // Adds a title to a row
                //row.tag = "location" // Upon parsing a form you get a nice key if you use a tag
                row.add(ruleSet: RuleSet<GooglePlace>()) // We can use GooglePlace() as a rule
                row.validationOptions = .validatesOnChangeAfterBlurred
                row.cell.textLabel?.textColor = UIColor.black
                row.placeFilter?.type = .address
                }
                .cellUpdate { cell, row in // Optional
                    // Do something when cell updates
        }
        
           <<< GooglePlacesTableRow("Destination") { row in
                row.title = "Destination" // Adds a title to a row
                //row.tag = "location" // Upon parsing a form you get a nice key if you use a tag
                row.add(ruleSet: RuleSet<GooglePlace>()) // We can use GooglePlace() as a rule
                row.validationOptions = .validatesOnChangeAfterBlurred
                row.cell.textLabel?.textColor = UIColor.black
                row.placeFilter?.type = .address
                }
                .cellUpdate { cell, row in // Optional
                    // Do something when cell updates
        }
        // Do any additional setup after loading the view, typically from a nib.
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

