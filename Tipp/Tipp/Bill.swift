//
//  Bill.swift
//  Tipp
//
//  Created by Giorgio Doganiero on 7/17/18.
//  Copyright © 2018 Giorgio Doganiero. All rights reserved.
//

import Foundation

class Bill {

    let bill: Double?
    let tipPercentage: Double?

    var tipAmount: Double {
        if let bill = bill, let tipPercentage = tipPercentage {
            return bill * tipPercentage / 100.0
        } else {
            return 0.0
        }

    }

    init(bill: Double? = 0.0, tipPercentage: Double? = 0.0) {
        self.bill = bill
        self.tipPercentage = tipPercentage
    }

}
