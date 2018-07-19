//
//  ViewController.swift
//  Tipp
//
//  Created by Giorgio Doganiero on 7/17/18.
//  Copyright © 2018 Giorgio Doganiero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipPercentage: UITextField!
    @IBOutlet weak var tipAmount: UILabel!

    var bill: Bill = Bill()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: Any) {

        if let totalBill = billAmount.text, let tip = tipPercentage.text {
            let tb = Double(totalBill)
            let tp = Double(tip)

            bill = Bill(bill: tb, tipPercentage: tp)
        }

        tipAmount.text = String(format: "$%.02f", bill.tipAmount)
    }
}

