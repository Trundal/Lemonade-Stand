//
//  ViewController.swift
//  Lemonade Stand
//
//  Created by Sigyn on 17/11/14.
//  Copyright (c) 2014 Vagabond Dream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // LABELS
    
    var titleLabel: UILabel!
    var dayLabel:UILabel!
    var mixLabel: UILabel!
    var inventoryLabel: UILabel!
    var moneyInventoryLabel: UILabel!
    var yesterdayResultsLabel: UILabel!
    var lemonsInventoryLabel: UILabel!
    var iceInventoryLabel: UILabel!
    var acidityMixLabel: UILabel!
    var lemonsMixLabel: UILabel!
    var iceMixLabel: UILabel!
    var todayWeatherLabel: UILabel!
    var yesterdayWeatherLabel: UILabel!
    var yesterdayAcidityLabel: UILabel!
    var yesterdayVisitorsLabel: UILabel!
    var yesterdaySalesLabel: UILabel!
    
    
    // BUTTONS
    
    var startDayButtonPressed: UILabel! // Convert to Button when ready
    
    
    // VIEWS
    
    // -- Master Views --
    var titleLabelContainer: UIView!
    var yesterdayContainer: UIView!
    var todayContainer: UIView!
    // -- todayContainer Sub-Views --
    var todayLabelContainer: UIView!
    // -- todayInventory Sub-Views --
    var todayInventoryContainer: UIView!
    var todayInventoryMoneyContainer: UIView!
    var todayInventoryLemonsContainer: UIView!
    var todayInventoryIceContainer: UIView!
    // ---- todayInventory Sub-Image Views ----
    var todayInventoryMoneyImage: UIImageView!
    var todayInventoryLemonsImage: UIImageView!
    var todayInventoryIceImage: UIImageView!
    // -- todayMixContainer Sub-Views --
    var todayMixContainer: UIView!
    var todayMixAcidityContainer: UIView!
    var todayMixLemonsContainer: UIView!
    var todayMixIceContainer: UIView!
    // ---- todayMix Sub-Image Views ----
    var todayMixAcidityImage: UIImageView!
    var todayMixLemonsImage: UIImageView!
    var todayMixIceImage: UIImageView!
    // -- todayWeatherContainer Sub-Views --
    var todayWeatherStartContainer: UIView!
    var todayWeatherContainer: UIView!
    var todayStartButtonContainer: UIImageView!
    // -- yesterdayResultsContainer Sub-Views --
    var yesterdayWeatherContainer: UIView!
    var yesterdayAcidityContainer: UIView!
    var yesterdayVisitorsContainer: UIView!
    var yesterdaySalesContainer: UIView!
    // ---- todayMix Sub-Image Views ----
    var yesterdayWeatherImage: UIImageView!
    var yesterdayAcidityImage: UIImageView!
    var yesterdayVisitorsImage: UIImageView!
    var yesterdaySalesImage: UIImageView!
    
    
    // CONSTANTS
    
    // -- Container Dimensions (in Percent)
    // -- Main Containers --
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupContainerViews() {
        titleLabelContainer = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * kTitleLabelContainerHeight))
        titleLabelContainer.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(titleLabelContainer)
        
        var titlePosition = titleLabelContainer.center
        titlePosition.y += 10
        titleLabel = UILabel()
        configPrimaryFontLabel(titleLabel, fontSize: 24, text: "Lemonade Stand")
        titleLabel.center = titlePosition
        titleLabelContainer.addSubview(titleLabel)
        
        todayContainer = UIView(frame: CGRect(x: 0, y: titleLabelContainer.frame.height, width: self.view.bounds.width, height: self.view.bounds.height * kTodayContainerHeight))
        todayContainer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: (224/255), alpha: 100)
        self.view.addSubview(todayContainer)
        setupTodayContainer(todayContainer)
        
        yesterdayContainer = UIView(frame: CGRect(x: 0, y: titleLabelContainer.frame.height + todayContainer.frame.height, width: self.view.bounds.width, height: self.view.bounds.height * kYesterdayContainerHeight))
        yesterdayContainer.backgroundColor = UIColor(red: (240/255), green: (244/255), blue: (250/255), alpha: 100)
        self.view.addSubview(yesterdayContainer)
        setupYesterdayContainer(yesterdayContainer)
    }
    
    func setupTodayContainer(containerView: UIView) {
        
        // Add todayLabelContainer to todayContainer
        todayLabelContainer = UIView(frame: CGRect(x: 0, y: 0, width: containerView.bounds.width, height: containerView.bounds.height * kRowDayLabel))
        containerView.addSubview(todayLabelContainer)
        
        var titlePosition = todayLabelContainer.center
        
        // Add dayLabel to todayLabelContainer
        dayLabel = UILabel()
        configPrimaryFontLabel(dayLabel, fontSize: 20, text: "Day 1")
        dayLabel.center = titlePosition
        todayLabelContainer.addSubview(dayLabel)
        
        // Add todayInnventoryContainer to todayContainer
        todayInventoryContainer = UIView(frame: CGRect(x: 0, y: todayLabelContainer.frame.height, width: containerView.bounds.width, height: containerView.bounds.height * kRowInventory))
        containerView.addSubview(todayInventoryContainer)
        
        // Add inventoryLabel to todayInventoryContainer
        titlePosition = todayInventoryContainer.center
        titlePosition.y = 10
        inventoryLabel = UILabel()
        configPrimaryFontLabel(inventoryLabel, fontSize: 18, text: "Today's Inventory")
        inventoryLabel.center = titlePosition
        todayInventoryContainer.addSubview(inventoryLabel)
        
        setupInventoryContainers(todayInventoryContainer)
        
        todayMixContainer = UIView(frame: CGRect(x: 0, y: todayLabelContainer.frame.height + todayInventoryContainer.frame.height, width: containerView.bounds.width, height: containerView.bounds.height * kRowMixLevels))
        containerView.addSubview(todayMixContainer)
        
        titlePosition = todayMixContainer.center
        titlePosition.y = 10
        mixLabel = UILabel()
        configPrimaryFontLabel(mixLabel, fontSize: 18, text: "Today's Special Brew")
        mixLabel.center = titlePosition
        todayMixContainer.addSubview(mixLabel)
        
        setupMixContainers(todayMixContainer)
        
        todayWeatherStartContainer = UIView(frame: CGRect(x: 0, y: todayLabelContainer.frame.height + todayInventoryContainer.frame.height + todayMixContainer.frame.height, width: containerView.bounds.width, height: containerView.bounds.height * kRowStartDay))
        containerView.addSubview(todayWeatherStartContainer)
        
        todayWeatherContainer = UIView(frame: CGRect(x: 0, y: 0, width: todayWeatherStartContainer.bounds.width * kColumnWeatherStart1, height: todayWeatherStartContainer.bounds.height))
        todayWeatherStartContainer.addSubview(todayWeatherContainer)
        
        titlePosition = todayWeatherContainer.center
        titlePosition.x = todayWeatherContainer.bounds.width/2
        todayWeatherLabel = UILabel()
        todayWeatherLabel.numberOfLines = 2
        configPrimaryFontLabel(todayWeatherLabel, fontSize: 18, text: "Today's\nWeather")
        todayWeatherLabel.center = titlePosition
        todayWeatherContainer.addSubview(todayWeatherLabel)
        
        todayStartButtonContainer = UIImageView(frame: CGRect(x: todayWeatherContainer.frame.width, y: 0, width: todayWeatherStartContainer.bounds.width * kColumnWeatherStart2, height: todayWeatherStartContainer.bounds.height))
        todayWeatherStartContainer.addSubview(todayStartButtonContainer)
        
        titlePosition = todayStartButtonContainer.center
        titlePosition.x = todayStartButtonContainer.bounds.width/2
        startDayButtonPressed = UILabel()
        configPrimaryFontLabel(startDayButtonPressed, fontSize: 18, text: "Start Day")
        startDayButtonPressed.center = titlePosition
        todayStartButtonContainer.addSubview(startDayButtonPressed)
    }
    
    
    // INVENTORY CONTAINERS
    
    func setupInventoryContainers(containerView: UIView) {
        
        // INVENTORY MONEY CONTAINTER
        
        todayInventoryMoneyContainer = UIView(frame: CGRect(x: containerView.bounds.width * kColumnBorder, y: 0, width: containerView.bounds.width * kColumnInvMix1, height: containerView.bounds.height))
        todayInventoryMoneyImage = UIImageView(frame: CGRect(x: (todayInventoryMoneyContainer.bounds.width - 107) / 2, y: (containerView.bounds.height - 104) / 2, width: 107.0, height: 104.0))
        containerView.addSubview(todayInventoryMoneyContainer)
        
        var titlePosition = todayInventoryMoneyContainer.center
        titlePosition.x = todayInventoryMoneyContainer.bounds.width/2
        titlePosition.y = todayInventoryMoneyContainer.bounds.height/2 + 18
        moneyInventoryLabel = UILabel()
        configPrimaryFontLabel(moneyInventoryLabel, fontSize: 24, text: "$10")
        moneyInventoryLabel.center = titlePosition
        
        todayInventoryMoneyImage.image = UIImage(named: "Star Icon")
        todayInventoryMoneyContainer.addSubview(todayInventoryMoneyImage)
        todayInventoryMoneyContainer.addSubview(moneyInventoryLabel)
    
        // INVENTORY LEMONS CONTAINER
        
        todayInventoryLemonsContainer = UIView(frame: CGRect(x: containerView.bounds.width * kColumnBorder + todayInventoryMoneyContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnInvMix2, height: containerView.bounds.height))
        todayInventoryLemonsImage = UIImageView(frame: CGRect(x: (todayInventoryLemonsContainer.bounds.width - 75) / 2, y: ((containerView.bounds.height - 54) / 2) + 10, width: 75.0, height: 54.0))
        containerView.addSubview(todayInventoryLemonsContainer)
        
        titlePosition = todayInventoryLemonsContainer.center
        titlePosition.x = todayInventoryLemonsContainer.bounds.width/2 + 13
        titlePosition.y = todayInventoryLemonsContainer.bounds.height/2 + 8
        lemonsInventoryLabel = UILabel()
        configPrimaryFontLabel(lemonsInventoryLabel, fontSize: 24, text: "1")
        lemonsInventoryLabel.center = titlePosition
        
        todayInventoryLemonsImage.image = UIImage(named: "Lemon Inventory Icon")
        todayInventoryLemonsContainer.addSubview(todayInventoryLemonsImage)
        todayInventoryLemonsContainer.addSubview(lemonsInventoryLabel)
        
        // INVENTORY ICE CONTAINER
        
        todayInventoryIceContainer = UIView(frame: CGRect(x: containerView.bounds.width * kColumnBorder + todayInventoryMoneyContainer.bounds.width + todayInventoryLemonsContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnInvMix3, height: containerView.bounds.height))
        todayInventoryIceImage = UIImageView(frame: CGRect(x: (todayInventoryIceContainer.bounds.width - 80) / 2, y: ((containerView.bounds.height - 55) / 2) + 10, width: 80.0, height: 55.0))
        containerView.addSubview(todayInventoryIceContainer)
        
        titlePosition = todayInventoryIceContainer.center
        titlePosition.x = todayInventoryIceContainer.bounds.width/2 + 12
        titlePosition.y = todayInventoryIceContainer.bounds.height/2 + 9
        iceInventoryLabel = UILabel()
        configPrimaryFontLabel(iceInventoryLabel, fontSize: 24, text: "1")
        iceInventoryLabel.center = titlePosition
        
        todayInventoryIceImage.image = UIImage(named: "Ice Inventory Icon")
        todayInventoryIceContainer.addSubview(todayInventoryIceImage)
        todayInventoryIceContainer.addSubview(iceInventoryLabel)

    }
    
    // MIX CONTAINERS
    
    func setupMixContainers(containerView: UIView) {
        
        // MIX ACIDITY CONTAINTER
        
        todayMixAcidityContainer = UIView(frame: CGRect(x: containerView.bounds.width * kColumnBorder, y: 0, width: containerView.bounds.width * kColumnInvMix1, height: containerView.bounds.height))
        todayMixAcidityImage = UIImageView(frame: CGRect(x: (todayMixAcidityContainer.bounds.width - 74) / 2, y: (containerView.bounds.height - 68) / 2, width: 74.0, height: 68.0))
        containerView.addSubview(todayMixAcidityContainer)
        
        var titlePosition = todayMixAcidityContainer.center
        titlePosition.x = todayMixAcidityContainer.bounds.width/2 + 3
        titlePosition.y = todayMixAcidityContainer.bounds.height - 25
        acidityMixLabel = UILabel()
        configPrimaryFontLabel(acidityMixLabel, fontSize: 18, text: "Strong (.6)")
        acidityMixLabel.center = titlePosition
        
        todayMixAcidityImage.image = UIImage(named: "Lemonade Icon")
        todayMixAcidityContainer.addSubview(todayMixAcidityImage)
        todayMixAcidityContainer.addSubview(acidityMixLabel)
        
        // MIX LEMONS CONTAINER
        
        todayMixLemonsContainer = UIView(frame: CGRect(x: containerView.bounds.width * kColumnBorder + todayMixAcidityContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnInvMix2, height: containerView.bounds.height))
        todayMixLemonsImage = UIImageView(frame: CGRect(x: (todayMixLemonsContainer.bounds.width - 49) / 2, y: ((containerView.bounds.height - 54) / 2) + 10, width: 49.0, height: 53.0))
        containerView.addSubview(todayMixLemonsContainer)
        
        titlePosition = todayMixLemonsContainer.center
        titlePosition.x = todayMixLemonsContainer.bounds.width/2 + 13
        titlePosition.y = todayMixLemonsContainer.bounds.height/2 + 8
        lemonsMixLabel = UILabel()
        configPrimaryFontLabel(lemonsMixLabel, fontSize: 24, text: "0")
        lemonsMixLabel.center = titlePosition
        
        todayMixLemonsImage.image = UIImage(named: "Lemon Icon")
        todayMixLemonsContainer.addSubview(todayMixLemonsImage)
        todayMixLemonsContainer.addSubview(lemonsMixLabel)
        
        // MIX ICE CONTAINER
        
        todayMixIceContainer = UIView(frame: CGRect(x: containerView.bounds.width * kColumnBorder + todayMixAcidityContainer.bounds.width + todayMixLemonsContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnInvMix3, height: containerView.bounds.height))
        todayMixIceImage = UIImageView(frame: CGRect(x: (todayMixIceContainer.bounds.width - 54) / 2, y: ((containerView.bounds.height - 55) / 2) + 10, width: 54.0, height: 55.0))
        containerView.addSubview(todayMixIceContainer)
        
        titlePosition = todayMixIceContainer.center
        titlePosition.x = todayMixIceContainer.bounds.width/2 + 12
        titlePosition.y = todayMixIceContainer.bounds.height/2 + 9
        iceMixLabel = UILabel()
        configPrimaryFontLabel(iceMixLabel, fontSize: 24, text: "1")
        iceMixLabel.center = titlePosition
        
        todayMixIceImage.image = UIImage(named: "Ice Icon")
        todayMixIceContainer.addSubview(todayMixIceImage)
        todayMixIceContainer.addSubview(iceMixLabel)
        
    }
    
    // YESTERDAY CONTAINER
    
    func setupYesterdayContainer(containerView: UIView) {
        
        // YESTERDAY MASTER CONTAINER (Incl. Title Header)
        
        yesterdayResultsLabel = UILabel()
        configPrimaryFontLabel(yesterdayResultsLabel, fontSize: 18, text: "Yesterday's Results")
        yesterdayResultsLabel.center = configCenterPoint(containerView, xOffset: 2.0, yOffset: 6.0)
        containerView.addSubview(yesterdayResultsLabel)
        
        // YESTERDAY WEATHER CONTAINTER
        
        yesterdayWeatherContainer = UIView(frame: CGRect(x: 0, y: 0, width: containerView.bounds.width * kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdayWeatherContainer)
        yesterdayWeatherImage = UIImageView(frame: CGRect(x: (yesterdayWeatherContainer.bounds.width - 37) / 2, y: ((containerView.bounds.height - 37) / 2), width: 37.0, height: 37.0))
        
        yesterdayWeatherLabel = UILabel()
        configPrimaryFontLabel(yesterdayWeatherLabel, fontSize: 14, text: "Weather")
        yesterdayWeatherLabel.center = configCenterPoint(yesterdayWeatherContainer, xOffset: 2.0, yOffset: 1.35)
        
        yesterdayWeatherImage.image = UIImage(named: "Warm")
        yesterdayWeatherContainer.addSubview(yesterdayWeatherImage)
        yesterdayWeatherContainer.addSubview(yesterdayWeatherLabel)
        
        // YESTERDAY ACIDITY CONTAINTER
        
        yesterdayAcidityContainer = UIView(frame: CGRect(x: yesterdayWeatherContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdayAcidityContainer)
        yesterdayAcidityImage = UIImageView(frame: CGRect(x: (yesterdayAcidityContainer.bounds.width - 37) / 2, y: ((containerView.bounds.height - 37) / 2), width: 37.0, height: 37.0))
        
        yesterdayAcidityLabel = UILabel()
        configPrimaryFontLabel(yesterdayAcidityLabel, fontSize: 14, text: "Strong")
        yesterdayAcidityLabel.center = configCenterPoint(yesterdayAcidityContainer, xOffset: 2.0, yOffset: 1.35)
        
        yesterdayAcidityImage.image = UIImage(named: "Lemonade Icon (small)")
        yesterdayAcidityContainer.addSubview(yesterdayAcidityImage)
        yesterdayAcidityContainer.addSubview(yesterdayAcidityLabel)
        
        // YESTERDAY VISITORS CONTAINTER
        
        yesterdayVisitorsContainer = UIView(frame: CGRect(x: yesterdayWeatherContainer.bounds.width + yesterdayAcidityContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdayVisitorsContainer)
        yesterdayVisitorsImage = UIImageView(frame: CGRect(x: (yesterdayVisitorsContainer.bounds.width - 37) / 2, y: ((containerView.bounds.height - 37) / 2), width: 37.0, height: 37.0))
        
        yesterdayVisitorsLabel = UILabel()
        configPrimaryFontLabel(yesterdayVisitorsLabel, fontSize: 14, text: "0 Visitors")
        yesterdayVisitorsLabel.center = configCenterPoint(yesterdayVisitorsContainer, xOffset: 2.0, yOffset: 1.35)
        
        yesterdayVisitorsImage.image = UIImage(named: "customers-icon")
        yesterdayVisitorsContainer.addSubview(yesterdayVisitorsImage)
        yesterdayVisitorsContainer.addSubview(yesterdayVisitorsLabel)
        
        // YESTERDAY SALES CONTAINTER
        
        yesterdaySalesContainer = UIView(frame: CGRect(x: yesterdayWeatherContainer.bounds.width + yesterdayAcidityContainer.bounds.width + yesterdayVisitorsContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdaySalesContainer)
        yesterdaySalesImage = UIImageView(frame: CGRect(x: (yesterdaySalesContainer.bounds.width - 44) / 2, y: ((containerView.bounds.height - 25) / 2), width: 44.0, height: 25.0))
        
        yesterdaySalesLabel = UILabel()
        configPrimaryFontLabel(yesterdaySalesLabel, fontSize: 14, text: "$0 Sales")
        yesterdaySalesLabel.center = configCenterPoint(yesterdaySalesContainer, xOffset: 2.0, yOffset: 1.35)
        
        yesterdaySalesImage.image = UIImage(named: "money_icon")
        yesterdaySalesContainer.addSubview(yesterdaySalesImage)
        yesterdaySalesContainer.addSubview(yesterdaySalesLabel)
        
        
        
        var imageTest = yesterdaySalesImage.image
        println(imageTest?.size.width)
        
      
    }
    
    
    func configPrimaryFontLabel(label: UILabel, fontSize: CGFloat, text: String) -> UILabel {
        var formattedLabel:UILabel = label
        formattedLabel.textColor = UIColor.blackColor()
        formattedLabel.font = UIFont(name: "BradleyHandITCTT-Bold", size: fontSize)
        formattedLabel.text = text
        formattedLabel.sizeToFit()
        
        return formattedLabel
    }
    
    // [xOffset: 2.0, yOffset: 2.0] = Center
    
    func configCenterPoint(containerView: UIView, xOffset: CGFloat, yOffset: CGFloat) -> CGPoint {
        var centerPoint = CGPoint()
        centerPoint.x = containerView.bounds.width/xOffset
        centerPoint.y = containerView.bounds.height/yOffset
        return centerPoint
    }
    


    
}

