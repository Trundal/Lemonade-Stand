//
//  DailyStats.swift
//  Lemonade Stand
//
//  Created by Sigyn on 23/11/14.
//  Copyright (c) 2014 Vagabond Dream. All rights reserved.
//

import Foundation
import UIKit

struct DailyStats {
    var totalMoney = 10
    var lemonInventory = 1
    var iceInventory = 1
    var lemonMix = 0
    var iceMix = 0
    var weather = UIImage(named: "Warm")
    var acidityLevel = "Unmixed"
    var sales = 0
    var visitors = 0
    
    init(startMoney: Int, startLemons:Int, startIce: Int, startSales: Int, startVisitors: Int, startAcidity: String) {
        totalMoney = startMoney
        lemonInventory = startLemons
        iceInventory = startIce
        sales = startSales
        visitors = startVisitors
        acidityLevel = startAcidity
    }
}


