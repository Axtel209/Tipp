//
//  Bill.swift
//  Tipp
//
//  Created by Giorgio Doganiero on 7/17/18.
//  Copyright © 2018 Giorgio Doganiero. All rights reserved.
//

import Foundation

class Tip: NSObject, NSCoding {

    class var getInstance : Tip {
        struct TipStructure {
            static let instance = Tip()
        }
        return TipStructure.instance
    }

    private var _total: Double
    private var _percentage: Int

    var total: Double {
        get{return _total}
        set(newTotal){_total = newTotal}
    }

    var percentage: Int {
        get{return _percentage}
        set(newPercentage){_percentage = newPercentage}
    }

    var amount: Double {
        return total * Double(_percentage) / 100.0
    }

    init(total: Double = 0.0, percentage: Int = 0) {
        self._total = total
        self._percentage = percentage
    }

    required convenience init?(coder aDecoder: NSCoder){
        self.init(total: 0.0, percentage: 0)

        total = aDecoder.decodeObject(forKey: "total") as! Double
        percentage = aDecoder.decodeObject(forKey: "percentage") as! Int
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(total, forKey: "total")
        aCoder.encode(percentage, forKey: "percentage")
    }

    func formatAmount(value: Double) -> String {
        return String(format: "$%.02f", value)
    }

    func calculateTip() -> Double{
        return total * Double(_percentage) / 100.0
    }

}
