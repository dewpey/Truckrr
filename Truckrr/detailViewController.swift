//
//  detailViewController.swift
//  Truckrr
//
//  Created by Drew Patel on 4/14/18.
//  Copyright © 2018 Drew Patel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class detailViewController: UIViewController {

    @IBOutlet weak var nameBox: UILabel!
    @IBOutlet weak var emailBox: UILabel!
    
    var shipperName: String!
    var shipperEmail: String!
    var shipmentId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameBox.text = shipperName
        emailBox.text = shipperEmail
        print(shipmentId)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shipWith(_ sender: Any) {
        let parameters: Parameters = [
            "$class": "org.acme.shipping.perishable.Contract",
            "contractId": Int(arc4random()),
            "sender": "sender@gmail.com",
            "truck": "resource:org.acme.shipping.perishable.Truck#\(shipperEmail!)",
            "shipment": "resource:org.acme.shipping.perishable.Shipment#\(shipmentId)",
            "price": 10
        ]
        
        Alamofire.request("http://138.68.233.59:3000/api/Contract",method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //var workingShipmentId = json["shipmentId"].int
                print(json)
                
            case .failure(let error):
                print(error)
            }
            
            
        }
        
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
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
