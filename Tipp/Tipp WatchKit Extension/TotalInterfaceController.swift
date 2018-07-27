//
//  InterfaceController.swift
//  Tipp WatchKit Extension
//
//  Created by Giorgio Doganiero on 7/17/18.
//  Copyright © 2018 Giorgio Doganiero. All rights reserved.
//

import WatchKit
import Foundation

class TotalInterfaceController: WKInterfaceController, WKCrownDelegate {

    @IBOutlet weak var groupTotalAmount: WKInterfaceGroup!
    @IBOutlet weak var billAmount: WKInterfaceLabel!

    var tip: Tip = Tip.getInstance
    var amount: Double = 0.0
    var state: Bool = true

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        crownSequencer.delegate = self
    }
    
    override func willActivate() {
        super.willActivate()
        crownSequencer.focus()

        amount = tip.total
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }

    // Update amount label
    func updateUI(_ amount: Double) {
        let bill = String(format: "%.02f", amount)
        billAmount.setText(bill)
    }

    func updateTotal(_ amount: Double) {
        tip.total = amount
    }

    // Round up two decimal places
    func roundDecimal(value: Double) -> Double{
        return (value * 100).rounded() / 100
    }

    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        // Increment & Decrement amount by at least 0.01
        if rotationalDelta > 0.005 {
            amount += roundDecimal(value: rotationalDelta)
        } else if rotationalDelta < -0.005 {
            if amount > 0.1 { // Decrement only if amount is greater then 0.00
                amount += roundDecimal(value: rotationalDelta)
            } else { // if amount goes to 0.00 or bellow set it to 0.00
                amount = 0.0
            }
        }

        updateUI(amount)
    }

    func crownDidBecomeIdle(_ crownSequencer: WKCrownSequencer?) {
        updateTotal(amount)
    }
    
    @IBAction func incrementState() {
        state = true
        groupTotalAmount.setBackgroundColor(#colorLiteral(red: 0.1490196078, green: 0.7607843137, blue: 0.5058823529, alpha: 1))
    }

    @IBAction func decrementState() {
        state = false
        groupTotalAmount.setBackgroundColor(#colorLiteral(red: 0.990222156, green: 0.3837115467, blue: 0.3845440745, alpha: 1))
    }

    @IBAction func byOne() {
        if state {
            amount += 1.0
        } else {
            amount -= 1.0
        }

        updateUI(amount)
        updateTotal(amount)
    }

    @IBAction func byFive() {
        if state {
            amount += 5.0
        } else {
            amount -= 5.0
        }

        updateUI(amount)
        updateTotal(amount)
    }

    @IBAction func byTen() {
        if state {
            amount += 10.0
        } else {
            amount -= 10.0
        }

        updateUI(amount)
        updateTotal(amount)
    }

    @IBAction func byOneHundred() {
        if state {
            amount += 100.0
        } else {
            amount -= 100.0
        }

        updateUI(amount)
        updateTotal(amount)
    }

}
