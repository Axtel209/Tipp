//
//  ViewController.swift
//  Tipp
//
//  Created by Giorgio Doganiero on 7/17/18.
//  Copyright © 2018 Giorgio Doganiero. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipPercentage: UITextField!
    @IBOutlet weak var tipAmount: UILabel!

    var wcSession: WCSession?
    var tip: Tip = Tip()

    override func viewDidLoad() {
        super.viewDidLoad()

        if WCSession.isSupported() {
            if let session = wcSession {
                wcSession = WCSession.default
                session.delegate = self
                session.activate()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        if let billAmount = billAmount.text,  let tipPercentage = tipPercentage.text {
            if let bill = Double(billAmount), let percentage = Int(tipPercentage) {
                tip = Tip(total: bill, percentage: percentage)
            }
        }

        tipAmount.text = tip.formatAmount(value: tip.amount)
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }

    func sessionDidBecomeInactive(_ session: WCSession) {
    }

    func sessionDidDeactivate(_ session: WCSession) {
    }

}

