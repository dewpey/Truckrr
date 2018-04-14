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
import BigInt
import web3swift
import Foundation

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
        
        
         let web3Rinkeby = Web3.InfuraRinkebyWeb3()
        //Balance on Rinkeby
        let balanceResult = web3Rinkeby.eth.getBalance(address: )
        guard case .success(let balance) = balanceResult else {return}
        print("Balance of " + coldWalletAddress.address + " = " + String(balance))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

