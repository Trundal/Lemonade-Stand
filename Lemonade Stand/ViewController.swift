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
    
    // -- Start Button --
    var startDayButtonButton: UIButton! // Convert to Button when ready
    
    // -- Inventory Buttons --
    var plusLemonInventoryButton: UIButton!
    var minusLemonInventoryButton: UIButton!
    var plusIceInventoryButton: UIButton!
    var minusIceInventoryButton: UIButton!
    
    // -- Mix Buttons --
    var plusLemonMixButton: UIButton!
    var minusLemonMixButton: UIButton!
    var plusIceMixButton: UIButton!
    var minusIceMixButton: UIButton!
    
    
    // VIEWS
    
    // -- Master Views --
    var titleLabelContainer: UIView!
    var yesterdayContainer: UIView!
    var todayContainer: UIView!
    var todayLabelContainer: UIView!
    
    // ---- todayInventoryContainer Sub-Views ----
    var todayInventoryContainer: UIView!
    var todayInventoryMoneyContainer: UIView!
    var inventoryMoneyImage = UIImage(named: "Star Icon")
    var todayInventoryLemonsContainer: UIView!
    var inventoryLemonsImage = UIImage(named: "Lemon Inventory Icon")
    var todayInventoryIceContainer: UIView!
    var inventoryIceImage = UIImage(named: "Ice Inventory Icon")

    // ---- todayMixContainer Sub-Views ----
    var todayMixContainer: UIView!
    var todayMixAcidityContainer: UIView!
    var mixAcidityImage = UIImage(named: "Lemonade Icon")
    var todayMixLemonsContainer: UIView!
    var mixLemonsImage = UIImage(named: "Lemon Icon")
    var todayMixIceContainer: UIView!
    var mixIceImage = UIImage(named: "Ice Icon")

    // ---- todayWeatherStartContainer Sub-Views ----
    var todayWeatherStartContainer: UIView!
    var todayWeatherContainer: UIView!
    var todayWeatherImage = UIImage(named: "Mild")
    var todayStartButtonContainer: UIImageView!
    var startButtonImage = UIImage(named: "Start Day Icon")
    
    // ---- yesterdayResultsContainer Sub-Views ----
    var yesterdayWeatherContainer: UIView!
    var yesterdayWeatherImage = UIImage(named: "Warm")
    var yesterdayAcidityContainer: UIView!
    var yesterdayAcidityImage = UIImage(named: "Lemonade Icon (small)")
    var yesterdayVisitorsContainer: UIView!
    var yesterdayVisitorsImage = UIImage(named: "customers-icon")
    var yesterdaySalesContainer: UIView!
    var yesterdaySalesImage = UIImage(named: "money_icon")
    
    
    // DEFAULT FONT DECLARATIONS
    
    var defaultFont = "BradleyHandITCTT-Bold"
    
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
        configFontLabel(titleLabel, font: defaultFont, fontSize: 24, text: "Lemonade Stand")
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
        configFontLabel(dayLabel, font: defaultFont, fontSize: 20, text: "Day 1")
        dayLabel.center = titlePosition
        todayLabelContainer.addSubview(dayLabel)
        
        // Add todayInnventoryContainer to todayContainer
        todayInventoryContainer = UIView(frame: CGRect(x: 0, y: todayLabelContainer.frame.height, width: containerView.bounds.width, height: containerView.bounds.height * kRowInventory))
        containerView.addSubview(todayInventoryContainer)
        
        // Add inventoryLabel to todayInventoryContainer
        titlePosition = todayInventoryContainer.center
        titlePosition.y = 10
        inventoryLabel = UILabel()
        configFontLabel(inventoryLabel, font: defaultFont, fontSize: 18, text: "Today's Inventory")
        inventoryLabel.center = titlePosition
        todayInventoryContainer.addSubview(inventoryLabel)
        
        setupInventoryContainers(todayInventoryContainer)
        
        todayMixContainer = UIView(frame: CGRect(x: 0, y: todayLabelContainer.frame.height + todayInventoryContainer.frame.height, width: containerView.bounds.width, height: containerView.bounds.height * kRowMixLevels))
        containerView.addSubview(todayMixContainer)
        
        titlePosition = todayMixContainer.center
        titlePosition.y = 10
        mixLabel = UILabel()
        configFontLabel(mixLabel, font: defaultFont, fontSize: 18, text: "Today's Special Brew")
        mixLabel.center = titlePosition
        todayMixContainer.addSubview(mixLabel)
        
        setupMixContainers(todayMixContainer)
        
        
        // TODAY'S WEATHER
        
        todayWeatherStartContainer = UIView(frame: CGRect(x: 0, y: todayLabelContainer.frame.height + todayInventoryContainer.frame.height + todayMixContainer.frame.height, width: containerView.bounds.width, height: containerView.bounds.height * kRowStartDay))
        containerView.addSubview(todayWeatherStartContainer)
        
        todayWeatherContainer = UIView(frame: CGRect(x: 0, y: 0, width: todayWeatherStartContainer.bounds.width * kColumnWeatherStart1, height: todayWeatherStartContainer.bounds.height))
        todayWeatherStartContainer.addSubview(todayWeatherContainer)
        
        todayWeatherLabel = UILabel()
        todayWeatherLabel.numberOfLines = 2
        configFontLabel(todayWeatherLabel, font: defaultFont, fontSize: 18, text: "Today's\nWeather")
        todayWeatherLabel.center = configCenterPoint(todayWeatherContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: 0.0, yOffset: 0.0)
        
        todayWeatherContainer.addSubview(configImageView(todayWeatherContainer, myImage: self.todayWeatherImage!, xOffset: 60, yOffset: 0))
        todayWeatherContainer.addSubview(todayWeatherLabel)
        
        
        // START BUTTON
        
        todayStartButtonContainer = UIImageView(frame: CGRect(x: todayWeatherContainer.frame.width, y: 0, width: todayWeatherStartContainer.bounds.width * kColumnWeatherStart2, height: todayWeatherStartContainer.bounds.height))
        todayWeatherStartContainer.addSubview(todayStartButtonContainer)
        
        todayStartButtonContainer.addSubview(configImageView(todayStartButtonContainer, myImage: self.startButtonImage!, xOffset: 0, yOffset: 0))
    }
    
    
    // INVENTORY CONTAINERS
    
    func setupInventoryContainers(containerView: UIView) {
        
        // INVENTORY MONEY CONTAINTER
        
        todayInventoryMoneyContainer = UIView(frame: CGRect(x: containerView.bounds.width * kColumnBorder, y: 0, width: containerView.bounds.width * kColumnInvMix1, height: containerView.bounds.height))
        
        containerView.addSubview(todayInventoryMoneyContainer)
        
        moneyInventoryLabel = UILabel()
        configFontLabel(moneyInventoryLabel, font: defaultFont, fontSize: 24, text: "$10")
        moneyInventoryLabel.center = configCenterPoint(todayInventoryMoneyContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: 0.0, yOffset: 18.0)
        
        todayInventoryMoneyContainer.addSubview(configImageView(todayInventoryMoneyContainer, myImage: self.inventoryMoneyImage!, xOffset: 0, yOffset: 0))
        todayInventoryMoneyContainer.addSubview(moneyInventoryLabel)
    
        // INVENTORY LEMONS CONTAINER
        
        todayInventoryLemonsContainer = UIView(frame: CGRect(x: containerView.bounds.width * kColumnBorder + todayInventoryMoneyContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnInvMix2, height: containerView.bounds.height))
        
        containerView.addSubview(todayInventoryLemonsContainer)
        
        lemonsInventoryLabel = UILabel()
        configFontLabel(lemonsInventoryLabel, font: defaultFont, fontSize: 24, text: "1")
        lemonsInventoryLabel.center = configCenterPoint(todayInventoryLemonsContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: 13.0, yOffset: 8.0)
        
        plusLemonInventoryButton = UIButton()
        configButtonText(plusLemonInventoryButton, font: defaultFont, fontSize: 24, text: "+")
        plusLemonInventoryButton.center = configCenterPoint(todayInventoryLemonsContainer, xDivisor: 2.0, yDivisor: 4.0, xOffset: 13.0, yOffset: 5.0)
        plusLemonInventoryButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        minusLemonInventoryButton = UIButton()
        configButtonText(minusLemonInventoryButton, font: defaultFont, fontSize: 40, text: "-")
        minusLemonInventoryButton.center = configCenterPoint(todayInventoryLemonsContainer, xDivisor: 2.0, yDivisor: 1.25, xOffset: 13.0, yOffset: 8.0)
        minusLemonInventoryButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        todayInventoryLemonsContainer.addSubview(configImageView(todayInventoryLemonsContainer, myImage: self.inventoryLemonsImage!, xOffset: 0.0, yOffset: 10.0))
        todayInventoryLemonsContainer.addSubview(lemonsInventoryLabel)
        todayInventoryLemonsContainer.addSubview(plusLemonInventoryButton)
        todayInventoryLemonsContainer.addSubview(minusLemonInventoryButton)
        
        
        // INVENTORY ICE CONTAINER
        
        todayInventoryIceContainer = UIView(frame: CGRect(x: containerView.bounds.width * kColumnBorder + todayInventoryMoneyContainer.bounds.width + todayInventoryLemonsContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnInvMix3, height: containerView.bounds.height))

        containerView.addSubview(todayInventoryIceContainer)
        
        iceInventoryLabel = UILabel()
        configFontLabel(iceInventoryLabel, font: defaultFont, fontSize: 24, text: "1")
        iceInventoryLabel.center = configCenterPoint(todayInventoryIceContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: 12.0, yOffset: 9.0)
        
        plusIceInventoryButton = UIButton()
        configButtonText(plusIceInventoryButton, font: defaultFont, fontSize: 24, text: "+")
        plusIceInventoryButton.center = configCenterPoint(todayInventoryIceContainer, xDivisor: 2.0, yDivisor: 4.0, xOffset: 12.0, yOffset: 5.0)
        plusIceInventoryButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        minusIceInventoryButton = UIButton()
        configButtonText(minusIceInventoryButton, font: defaultFont, fontSize: 40, text: "-")
        minusIceInventoryButton.center = configCenterPoint(todayInventoryIceContainer, xDivisor: 2.0, yDivisor: 1.25, xOffset: 12.0, yOffset: 8.0)
        minusIceInventoryButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        todayInventoryIceContainer.addSubview(configImageView(todayInventoryIceContainer, myImage: self.inventoryIceImage!, xOffset: 0.0, yOffset: 10.0))
        todayInventoryIceContainer.addSubview(iceInventoryLabel)
        todayInventoryIceContainer.addSubview(plusIceInventoryButton)
        todayInventoryIceContainer.addSubview(minusIceInventoryButton)

    }
    
    // MIX CONTAINERS
    
    func setupMixContainers(containerView: UIView) {
        
        // MIX ACIDITY CONTAINTER
        
        todayMixAcidityContainer = UIView(frame: CGRect(x: containerView.bounds.width * kColumnBorder, y: 0, width: containerView.bounds.width * kColumnInvMix1, height: containerView.bounds.height))

        containerView.addSubview(todayMixAcidityContainer)
        
        acidityMixLabel = UILabel()
        configFontLabel(acidityMixLabel, font: defaultFont, fontSize: 18, text: "Strong (.6)")
        acidityMixLabel.center = configCenterPoint(todayMixAcidityContainer, xDivisor: 2.0, yDivisor: 1.0, xOffset: 13.0, yOffset: -10.0)
        
        todayMixAcidityContainer.addSubview(configImageView(todayMixAcidityContainer, myImage: self.mixAcidityImage!, xOffset: 10.0, yOffset: 5.0))
        todayMixAcidityContainer.addSubview(acidityMixLabel)
        
        // MIX LEMONS CONTAINER
        
        todayMixLemonsContainer = UIView(frame: CGRect(x: containerView.bounds.width * kColumnBorder + todayMixAcidityContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnInvMix2, height: containerView.bounds.height))

        containerView.addSubview(todayMixLemonsContainer)
        
        lemonsMixLabel = UILabel()
        configFontLabel(lemonsMixLabel, font: defaultFont, fontSize: 24, text: "0")
        lemonsMixLabel.center = configCenterPoint(todayMixLemonsContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: 10.0, yOffset: 9.0)
        
        plusLemonMixButton = UIButton()
        configButtonText(plusLemonMixButton, font: defaultFont, fontSize: 24, text: "+")
        plusLemonMixButton.center = configCenterPoint(todayMixLemonsContainer, xDivisor: 2.0, yDivisor: 4.0, xOffset: 12.0, yOffset: 5.0)
        plusLemonMixButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        minusLemonMixButton = UIButton()
        configButtonText(minusLemonMixButton, font: defaultFont, fontSize: 40, text: "-")
        minusLemonMixButton.center = configCenterPoint(todayMixLemonsContainer, xDivisor: 2.0, yDivisor: 1.25, xOffset: 12.0, yOffset: 8.0)
        minusLemonMixButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        todayMixLemonsContainer.addSubview(configImageView(todayMixLemonsContainer, myImage: self.mixLemonsImage!, xOffset: 10.0, yOffset: 10.0))
        todayMixLemonsContainer.addSubview(lemonsMixLabel)
        todayMixLemonsContainer.addSubview(plusLemonMixButton)
        todayMixLemonsContainer.addSubview(minusLemonMixButton)
        
        // MIX ICE CONTAINER
        
        todayMixIceContainer = UIView(frame: CGRect(x: containerView.bounds.width * kColumnBorder + todayMixAcidityContainer.bounds.width + todayMixLemonsContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnInvMix3, height: containerView.bounds.height))

        containerView.addSubview(todayMixIceContainer)
        
        iceMixLabel = UILabel()
        configFontLabel(iceMixLabel, font: defaultFont, fontSize: 24, text: "0")
        iceMixLabel.center = configCenterPoint(todayMixAcidityContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: -4.0, yOffset: 9.0)
        
        plusIceMixButton = UIButton()
        configButtonText(plusIceMixButton, font: defaultFont, fontSize: 24, text: "+")
        plusIceMixButton.center = configCenterPoint(todayMixIceContainer, xDivisor: 2.0, yDivisor: 4.0, xOffset: 12.0, yOffset: 5.0)
        plusIceMixButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        minusIceMixButton = UIButton()
        configButtonText(minusIceMixButton, font: defaultFont, fontSize: 40, text: "-")
        minusIceMixButton.center = configCenterPoint(todayMixIceContainer, xDivisor: 2.0, yDivisor: 1.25, xOffset: 12.0, yOffset: 8.0)
        minusIceMixButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        todayMixIceContainer.addSubview(configImageView(todayMixIceContainer, myImage: self.mixIceImage!, xOffset: 10.0, yOffset: 10.0))
        todayMixIceContainer.addSubview(iceMixLabel)
        todayMixIceContainer.addSubview(plusIceMixButton)
        todayMixIceContainer.addSubview(minusIceMixButton)
        
    }
    
    // YESTERDAY CONTAINERS
    
    func setupYesterdayContainer(containerView: UIView) {
        
        // YESTERDAY MASTER CONTAINER (Incl. Title Header)
        
        yesterdayResultsLabel = UILabel()
        configFontLabel(yesterdayResultsLabel, font: defaultFont, fontSize: 18, text: "Yesterday's Results")
        yesterdayResultsLabel.center = configCenterPoint(containerView, xDivisor: 2.0, yDivisor: 6.0, xOffset: 0.0, yOffset: 0.0)
        containerView.addSubview(yesterdayResultsLabel)
        
        // YESTERDAY WEATHER CONTAINTER
        
        yesterdayWeatherContainer = UIView(frame: CGRect(x: 0, y: 0, width: containerView.bounds.width * kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdayWeatherContainer)
        
        yesterdayWeatherLabel = UILabel()
        configFontLabel(yesterdayWeatherLabel, font: defaultFont, fontSize: 14, text: "Weather")
        yesterdayWeatherLabel.center = configCenterPoint(yesterdayWeatherContainer, xDivisor: 2.0, yDivisor: 1.35, xOffset: 0.0, yOffset: 0.0)
        
        yesterdayWeatherContainer.addSubview(configImageView(yesterdayWeatherContainer, myImage: self.yesterdayWeatherImage!, xOffset: 0.0, yOffset: 0.0))
        yesterdayWeatherContainer.addSubview(yesterdayWeatherLabel)
        
        // YESTERDAY ACIDITY CONTAINTER
        
        yesterdayAcidityContainer = UIView(frame: CGRect(x: yesterdayWeatherContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdayAcidityContainer)
        
        yesterdayAcidityLabel = UILabel()
        configFontLabel(yesterdayAcidityLabel, font: defaultFont, fontSize: 14, text: "Strong")
        yesterdayAcidityLabel.center = configCenterPoint(yesterdayAcidityContainer, xDivisor: 2.0, yDivisor: 1.35, xOffset: 0.0, yOffset: 0.0)
        
        yesterdayAcidityContainer.addSubview(configImageView(yesterdayAcidityContainer, myImage: self.yesterdayAcidityImage!, xOffset: 0.0, yOffset: 0.0))
        yesterdayAcidityContainer.addSubview(yesterdayAcidityLabel)
        
        // YESTERDAY VISITORS CONTAINTER
        
        yesterdayVisitorsContainer = UIView(frame: CGRect(x: yesterdayWeatherContainer.bounds.width + yesterdayAcidityContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdayVisitorsContainer)
        
        yesterdayVisitorsLabel = UILabel()
        configFontLabel(yesterdayVisitorsLabel, font: defaultFont, fontSize: 14, text: "0 Visitors")
        yesterdayVisitorsLabel.center = configCenterPoint(yesterdayVisitorsContainer, xDivisor: 2.0, yDivisor: 1.35, xOffset: 0.0, yOffset: 0.0)
        
        yesterdayVisitorsContainer.addSubview(configImageView(yesterdayVisitorsContainer, myImage: self.yesterdayVisitorsImage!, xOffset: 0.0, yOffset: 0.0))
        yesterdayVisitorsContainer.addSubview(yesterdayVisitorsLabel)
        
        // YESTERDAY SALES CONTAINTER
        
        yesterdaySalesContainer = UIView(frame: CGRect(x: yesterdayWeatherContainer.bounds.width + yesterdayAcidityContainer.bounds.width + yesterdayVisitorsContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdaySalesContainer)
        
        yesterdaySalesLabel = UILabel()
        configFontLabel(yesterdaySalesLabel, font: defaultFont, fontSize: 14, text: "$0 Sales")
        yesterdaySalesLabel.center = configCenterPoint(yesterdaySalesContainer, xDivisor: 2.0, yDivisor: 1.35, xOffset: 0.0, yOffset: 0.0)
        
        yesterdaySalesContainer.addSubview(configImageView(yesterdaySalesContainer, myImage: self.yesterdaySalesImage!, xOffset: 0.0, yOffset: 0.0))
        yesterdaySalesContainer.addSubview(yesterdaySalesLabel)
      
    }
    
    func configFontLabel(label: UILabel, font: String, fontSize: CGFloat, text: String) -> UILabel {
        var formattedLabel:UILabel = label
        formattedLabel.textColor = UIColor.blackColor()
        formattedLabel.font = UIFont(name: font, size: fontSize)
        formattedLabel.text = text
        formattedLabel.sizeToFit()
        
        return formattedLabel
    }
    
    func configButtonText(myButton: UIButton, font: String, fontSize: CGFloat, text: String) -> UIButton {
        var formattedButtonText:UIButton = myButton
        formattedButtonText.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        formattedButtonText.titleLabel?.font = UIFont(name: font, size: fontSize)
        formattedButtonText.setTitle(text, forState: UIControlState.Normal)
        formattedButtonText.sizeToFit()
        
        return formattedButtonText
    }
    
    func configCenterPoint(containerView: UIView, xDivisor: CGFloat, yDivisor: CGFloat, xOffset: CGFloat, yOffset: CGFloat) -> CGPoint {
        var centerPoint = CGPoint()
        centerPoint.x = containerView.bounds.width/xDivisor + xOffset
        centerPoint.y = containerView.bounds.height/yDivisor + yOffset
        
        return centerPoint
    }
    
    func configImageView(myView: UIView, myImage: UIImage, xOffset: CGFloat, yOffset: CGFloat) -> UIImageView {
        var myImageView = UIImageView(frame: CGRect(x: (myView.bounds.width - (myImage.size.width / 2)) / 2 + xOffset, y: (myView.bounds.height - (myImage.size.height/2)) / 2 + yOffset, width: myImage.size.width / 2, height: myImage.size.height / 2))
        myImageView.image = myImage
        
        return myImageView
    }
    
    func showAlertWithText (header : String = "Warning", message : String) {
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    
}

