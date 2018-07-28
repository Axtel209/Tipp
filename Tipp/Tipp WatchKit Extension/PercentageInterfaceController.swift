//
//  PercentageInterfaceController.swift
//  Tipp WatchKit Extension
//
//  Created by Giorgio Doganiero on 7/26/18.
//  Copyright © 2018 Giorgio Doganiero. All rights reserved.
//

import WatchKit
import Foundation


class PercentageInterfaceController: WKInterfaceController, WKCrownDelegate {

    @IBOutlet weak var tipPercentage: WKInterfaceLabel!

    var tip: Tip = Tip.getInstance
    var percentage: Int = 0

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        crownSequencer.delegate = self
    }

    override func willActivate() {
        super.willActivate()

        crownSequencer.focus()
        percentage = tip.percentage
    }

    override func didAppear() {
        let tipString = String(tip.percentage)
        tipPercentage.setText(tipString)
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    // Update percentage label
    func updateUI(_ amount: Int) {
        percentage = amount

        let tipString = String(amount)
        tipPercentage.setText(tipString)
    }

    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        let delta = rotationalDelta * 50

        if delta >= 0.1 {
            percentage += Int(round(delta))
        } else if delta <= -0.1 {
            if percentage > 0 { // Decrement only if amount is greater then 0
                percentage += Int(round(delta))
            } else { // if amount goes to 0 or bellow set it to 0
                percentage = 0
            }
        }

        updateUI(percentage)
    }

    func crownDidBecomeIdle(_ crownSequencer: WKCrownSequencer?) {
        tip.percentage = percentage
    }

    @IBAction func lowPercentage() {
        updateUI(15)
        tip.percentage = percentage
    }

    @IBAction func medPercentage() {
        updateUI(20)
        tip.percentage = percentage
    }

    @IBAction func highPercentage() {
        updateUI(25)
        tip.percentage = percentage
    }

}
