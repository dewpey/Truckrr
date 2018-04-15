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
import Foundation
import Alamofire
import PostalAddressRow
import SwiftyJSON
class FirstViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        form +++
            Section("General Information")
            <<< NameRow("Name"){ row in
                row.title = "Name of Good"
                row.placeholder = "Lobster"
            }
           /* <<< TextRow("Description"){ row in
                row.title = "Description"
                row.placeholder = "It has claws."
            } */
            <<< DateRow("Pickup"){
                $0.title = "Pickup Date"
                $0.value = Date()
            }
            <<< DateRow("Delivery"){
                $0.title = "Desired Delivery Date"
                $0.value = Date()
            }
            <<< SegmentedRow<String>("Fragility") { row in
                row.options = ["Not Fragile", "Fragile"]
                row.value = "Not Fragile"
            }
            
            <<< ActionSheetRow<String>("type") {
                $0.title = "Type"
                $0.selectorTitle = "Pick type of good"
                $0.options = ["FOOD","MATERIAL","ANIMAL","ELECTRONICS","GENERAL"]
                $0.value = "FOOD"    // initially selected
            }
        
            <<< LabelRow() {
             $0.title = "Origin"
            }
            <<< PostalAddressRow("Origin") {
                $0.streetPlaceholder = "Street"
                $0.statePlaceholder = "State"
                $0.cityPlaceholder = "City"
                $0.countryPlaceholder = "Country"
                $0.postalCodePlaceholder = "Zip code"
            }
            <<< LabelRow() {
                $0.title = "Destination"
            }
            <<< PostalAddressRow("Destination") {
                $0.streetPlaceholder = "Street"
                $0.statePlaceholder = "State"
                $0.cityPlaceholder = "City"
                $0.countryPlaceholder = "Country"
                $0.postalCodePlaceholder = "Zip code"
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

    @IBAction func nextPressed(_ sender: Any) {
        var valuesDictionary : Dictionary! = form.values()
        var originPostalAddress = valuesDictionary["Origin"]! as? PostalAddress
        var originStreet = originPostalAddress?.street
        var originCity = originPostalAddress?.city
        var originState = originPostalAddress?.state
        var originZip = originPostalAddress?.postalCode
        var originCountry = originPostalAddress?.country
        var originPostalAddressFormatted = "\(originStreet!), \(originCity!), \(originState!) \(originZip!) \(originCountry!)"
        print(originPostalAddressFormatted)
        
        var destinationPostalAddress = valuesDictionary["Destination"]! as? PostalAddress
        var destinationStreet = destinationPostalAddress?.street
        var destinationCity = destinationPostalAddress?.city
        var destinationState = destinationPostalAddress?.state
        var destinationZip = destinationPostalAddress?.postalCode
        var destinationCountry = destinationPostalAddress?.country
        var destinationPostalAddressFormatted = "\(destinationStreet!), \(destinationCity!), \(destinationState!) \(destinationZip!) \(destinationCountry!)"
        print(destinationPostalAddressFormatted)
        
        
        print(valuesDictionary)
        let shipmentId = arc4random()
        let parameters: Parameters = [
            "$class": "org.acme.shipping.perishable.Shipment",
            "shipmentId": String(shipmentId),
            "type": valuesDictionary["type"]!,
            "name": valuesDictionary["Name"]!,
            "status": "CREATED",
            "unitCount": 1,
            "width": valuesDictionary["Width"]!,
            "length": valuesDictionary["Length"]!,
            "height": valuesDictionary["Height"]!,
            "weight": valuesDictionary["Weight"]!,
            "origin": originPostalAddressFormatted,
            "destination": destinationPostalAddressFormatted,
            "currentLocation": originPostalAddressFormatted,
            "contract": "resource:org.acme.shipping.perishable.Contract#0106"
            
        ]
        Alamofire.request("http://138.68.233.59:3000/api/Shipment",method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //var workingShipmentId = json["shipmentId"].int
                let controller = detailViewController()
                controller.shipmentId = Int(shipmentId)
                print(json)
                
                self.performSegue(withIdentifier: "toListing", sender: nil)
            case .failure(let error):
                print(error)
            }
            
        
        }
        
       // let Origin = valuesDictionary["Origin"]! as! GooglePlace
        
        //print(Origin.prediction)
        //let description = valuesDictionary["Destination"]!
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

