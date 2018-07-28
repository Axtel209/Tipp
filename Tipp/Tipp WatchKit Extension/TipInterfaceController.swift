//
//  TipInterfaceController.swift
//  Tipp WatchKit Extension
//
//  Created by Giorgio Doganiero on 7/27/18.
//  Copyright © 2018 Giorgio Doganiero. All rights reserved.
//

import WatchKit
import Foundation


class TipInterfaceController: WKInterfaceController {

    @IBOutlet weak var tipAmount: WKInterfaceLabel!

    var tip: Tip = Tip.getInstance

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didAppear() {
        let tipString = String(format: "%.02f", tip.calculateTip())
        tipAmount.setText(tipString)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
