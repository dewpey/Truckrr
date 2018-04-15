//
//  ShipmentDetailViewController.swift
//  Truckrr
//
//  Created by Drew Patel on 4/15/18.
//  Copyright © 2018 Drew Patel. All rights reserved.
//

import UIKit

class ShipmentDetailViewController: UIViewController {

    
    @IBOutlet weak var titleBox: UILabel!
    
    var shipmentName: String!
    var contractId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleBox.text = shipmentName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
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
