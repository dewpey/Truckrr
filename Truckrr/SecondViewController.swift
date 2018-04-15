//
//  SecondViewController.swift
//  Truckrr
//
//  Created by Drew Patel on 4/13/18.
//  Copyright © 2018 Drew Patel. All rights reserved.
//
import UIKit
import Eureka
import GooglePlacesRow
import UIKit

class SecondViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        form +++
            Section("General Information")
            <<< NameRow("Name"){ row in
                row.title = "First and Last Name"
                row.placeholder = "John Smith"
        }
            <<< IntRow("Space"){ row in
                row.title = "Width (Cubic ft)"
                row.placeholder = "1700"
        }
        MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
                           header: "Description of truck",
                           footer: ".Insert adds a 'Add Item' (Add New Tag) button row as last cell.") {
                            $0.addButtonProvider = { section in
                                return ButtonRow(){
                                    $0.title = "Capability of cooling"
                                }
                            }
                            $0.multivaluedRowToInsertAt = { index in
                                return NameRow() {
                                    $0.placeholder = "Can easily transport furniture"
                                }
                            }
                            $0 <<< NameRow() {
                                $0.placeholder = "Extra properties"
                            }
            }
        
          +++ Section("Work Dates")
            <<< DateRow(){
                $0.title = "Start Work"
                $0.value = Date()
        }
            <<< DateRow(){
                $0.title = "End Work"
                $0.value = Date()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

