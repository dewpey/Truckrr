//
//  TruckerCurrentShipmentsTableViewController.swift
//  Truckrr
//
//  Created by Drew Patel on 4/14/18.
//  Copyright © 2018 Drew Patel. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class Contract {
    var senderId: String!
    var contractId: String!
    var shipmentId: String!
    var price: Double
    var truckId: String!
    
    var shipmentName: String!
    var shipmentOrigin: String!
    var shipmentDestination: String!
    var shipmentHeight: Double!
    var shipmentWidth: Double!
    var shipmentLength: Double!
    var shipmentWeight: Int!
    var shipmentStatus: String!
    var shipmentUnitCount: Int!
    var shipmentType: String!
    
    var senderName: String!
    var senderEmail: String!
    
    
    init (value: JSON) {
        let json = JSON(value)
        
        senderId = json["sender"].string
        contractId = json["contractId"].string
        shipmentId = json["shipment"].string
        price = json["price"].double!
        truckId = json["truck"].string
        if let dotRange = shipmentId.range(of: "#") {
            shipmentId.removeSubrange(shipmentId.startIndex..<(dotRange.lowerBound))
        }
        if let dotRange = senderId.range(of: "#") {
            senderId.removeSubrange(senderId.startIndex..<(dotRange.lowerBound))
        }
        Alamofire.request("http://138.68.233.59:3000/api/Shipment/\(shipmentId!)", encoding: JSONEncoding.default).responseJSON { response in
            print(response.request)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
                self.shipmentName = json[0]["name"].string
                self.shipmentOrigin = json[0]["origin"].string
                self.shipmentDestination = json[0]["destination"].string
                self.shipmentHeight = json[0]["height"].double
                self.shipmentWidth = json[0]["width"].double
                self.shipmentLength = json[0]["length"].double
                self.shipmentWeight = json[0]["weight"].int
                self.shipmentStatus = json[0]["status"].string
                self.shipmentType = json[0]["type"].string
                self.shipmentUnitCount = json[0]["unitCount"].int
            case .failure(let error):
                print(error)
            }
        
        
    }
        Alamofire.request("http://138.68.233.59:3000/api/Sender/\(senderId!)", encoding: JSONEncoding.default).responseJSON { response in
            print(response.request)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.senderName = json["name"].string
                self.senderEmail = json["email"].string
            case .failure(let error):
                print(error)
            }
            
            
        }
    
}
}

class TruckerCurrentShipmentsTableViewController: UITableViewController {

    var contracts = [Contract]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let parameters: Parameters = [
            "filter": ["where": ["truck": "resource:org.acme.shipping.perishable.Truck#shipper@gmail.com"]]
        ]
        print("hello")
        
        Alamofire.request("http://138.68.233.59:3000/api/Contract", encoding: JSONEncoding.default).responseJSON { response in
            print(response.request)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for (key,subJson):(String, JSON) in json {
                    self.contracts.append(Contract(value: subJson))
                    print(self.contracts[0].senderId)
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
            
            
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contracts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MasterViewControllerCell
        cell.title.text = contracts[indexPath.row].contractId
        cell.descriptionBox.text = contracts[indexPath.row].senderId
                let prices = ["$175", "$280", "$500", "$600", "$700", "$800"]
        cell.price.text = prices[indexPath.row]

print(contracts[indexPath.row].senderEmail)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShipmentDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let item = self.contracts[indexPath.row]
                print(item.contractId)
                //create a reference to the detail view controller
                let controller = (segue.destination as! UINavigationController).topViewController as! ShipmentDetailViewController
                //set all the variables of detailview controller
                controller.shipmentName = item.shipmentName
                controller.contractId = item.contractId
            }
        }
    }
    

}
