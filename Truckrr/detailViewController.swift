//
//  detailViewController.swift
//  Truckrr
//
//  Created by Drew Patel on 4/14/18.
//  Copyright © 2018 Drew Patel. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var nameBox: UILabel!
    @IBOutlet weak var emailBox: UILabel!
    
    var shipperName: String!
    var shipperEmail: String!
    var shipmentId: Int = 0
    
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
