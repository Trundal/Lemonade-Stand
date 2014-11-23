//
//  ViewLayout.swift
//  Lemonade Stand
//
//  Created by Sigyn on 23/11/14.
//  Copyright (c) 2014 Vagabond Dream. All rights reserved.
//

import Foundation
import UIKit

struct ViewLayout {
   
    // CONSTANTS
    
    // -- Container Dimensions (in Percent)
    // -- Main Containers (Columns) --
    let kTitleLabelContainerHeight:CGFloat = 0.11
    let kTodayContainerHeight:CGFloat = 0.67
    let kYesterdayContainerHeight:CGFloat = 0.22
    
    // -- Sub Containers (From Bounding Container - in Percent) --
    // ---- Rows ----
    let kRowTitleLabel:CGFloat = 0.11
    let kRowDayLabel:CGFloat = 0.10
    let kRowInventory:CGFloat = 0.36
    let kRowMixLevels:CGFloat = 0.36
    let kRowStartDay:CGFloat = 0.18
    let kRowYesterday:CGFloat = 0.22
    // ---- Columns ----
    let kColumnBorder:CGFloat = 0.06
    let kColumnInvMix1:CGFloat = 0.34
    let kColumnInvMix2:CGFloat = 0.27
    let kColumnInvMix3:CGFloat = 0.27
    let kColumnWeatherStart1:CGFloat = 0.5
    let kColumnWeatherStart2:CGFloat = 0.5
    let kColumnYesterday:CGFloat = 0.25
    
    // UIImage DECLARATIONS
    
    let inventoryMoneyImage = UIImage(named: "Star Icon")
    let inventoryLemonsImage = UIImage(named: "Lemon Inventory Icon")
    let inventoryIceImage = UIImage(named: "Ice Inventory Icon")
    let mixAcidityImage = UIImage(named: "Lemonade Icon")
    let mixLemonsImage = UIImage(named: "Lemon Icon")
    let mixIceImage = UIImage(named: "Ice Icon")
    let startButtonImage = UIImage(named: "Start Day Icon")
    let yesterdayAcidityImage = UIImage(named: "Lemonade Icon (small)")
    let yesterdayVisitorsImage = UIImage(named: "customers-icon")
    let yesterdaySalesImage = UIImage(named: "money_icon")
    
    // DEFAULT FONT DECLARATIONS
    
    let defaultFont = "BradleyHandITCTT-Bold"
    
    
}
