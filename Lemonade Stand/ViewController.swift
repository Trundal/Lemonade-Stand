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
    var yesterdayStartLabel: UILabel!
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
    var startDayButton: UIButton!
    
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
    var todayInventoryLemonsContainer: UIView!
    var todayInventoryIceContainer: UIView!

    // ---- todayMixContainer Sub-Views ----
    var todayMixContainer: UIView!
    var todayMixAcidityContainer: UIView!
    var todayMixLemonsContainer: UIView!
    var todayMixIceContainer: UIView!

    // ---- todayWeatherStartContainer Sub-Views ----
    var todayWeatherStartContainer: UIView!
    var todayWeatherContainer: UIView!
    var todayWeatherImage: UIImageView!
    var todayStartButtonContainer: UIView!
    
    // ---- yesterdayResultsContainer Sub-Views ----
    var yesterdayWeatherContainer: UIView!
    var yesterdayWeatherImage: UIImageView!
    var yesterdayAcidityContainer: UIView!
    var yesterdayVisitorsContainer: UIView!
    var yesterdaySalesContainer: UIView!
    
    
    // STARTING VALUES
    
    var customerArray:[Customer] = []
    var myCustomer = Customer()
    var yesterdayVisitors = 0
    
    var dayArray:[DailyStats] = []
    var today = DailyStats(startMoney: 10, startLemons: 1, startIce: 1, startSales: 0, startVisitors: 0, startAcidity: "Unmixed") // Also sets defaults
    
    var dayNumber:Int = 0
    
    var myLayoutConstants = ViewLayout()
    var price = Price()
    
    
    // VIEW DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dayArray.append(today)
        today.weather = randomWeather()
        setupContainerViews()
        updateMainView()
        updateYesterdayView ()
    }
    
    // IBActions
    
    // INVENTORY FUNCTIONS
    
    func buyLemonPressed (button: UIButton) {
        if today.totalMoney >= price.lemonPrice {
            today.totalMoney -= price.lemonPrice
            today.lemonInventory++
            updateMainView()
        }
    }
    
    func sellLemonPressed (button: UIButton) {
        if today.lemonInventory > 0 {
            today.totalMoney += price.lemonPrice
            today.lemonInventory--
            updateMainView()
        }
    }
    
    func buyIcePressed (button: UIButton) {
        if today.totalMoney >= price.icePrice {
            today.totalMoney -= price.icePrice
            today.iceInventory++
            updateMainView()
        }
    }
    
    func sellIcePressed (button: UIButton) {
        if today.iceInventory > 0 {
            today.totalMoney += price.icePrice
            today.iceInventory--
            updateMainView()
        }
    }
    
    
    // MIX FUNTIONS
    
    func addLemonPressed (button: UIButton) {
        if today.lemonInventory > 0 {
            today.lemonInventory--
            today.lemonMix++
            today.acidityLevel = checkLemonadeStrength(today.lemonMix, ice: today.iceMix)
            updateMainView()
        }
    }
    
    func removeLemonPressed (button: UIButton) {
        if today.lemonMix > 0 {
            today.lemonInventory++
            today.lemonMix--
            today.acidityLevel = checkLemonadeStrength(today.lemonMix, ice: today.iceMix)
            updateMainView()
        }
    }
    
    func addIcePressed (button: UIButton) {
        if today.iceInventory > 0 {
            today.iceInventory--
            today.iceMix++
            today.acidityLevel = checkLemonadeStrength(today.lemonMix, ice: today.iceMix)
            updateMainView()
        }
    }
    
    func removeIcePressed (button: UIButton) {
        if today.iceMix > 0 {
            today.iceInventory++
            today.iceMix--
            today.acidityLevel = checkLemonadeStrength(today.lemonMix, ice: today.iceMix)
            updateMainView()
        }
    }
    
    // START BUTTON PRESSED
    
    func startDayButtonPressed (button: UIButton) {

        if today.lemonMix == 0 || today.iceMix == 0 {
            showAlertWithText(header: "Today's Brew Not Mixed", message: "Add More Lemons or Ice")
        } else {
            var weatherBonus = 0
            if today.weather == UIImage (named: "Warm") {
                weatherBonus = Int(arc4random_uniform(UInt32(4))) + 1
                println ("Size of Weather Bonus: \(weatherBonus)")
            } else if today.weather == UIImage (named: "Cold") {
                weatherBonus = (Int(arc4random_uniform(UInt32(3))) + 1) * -1
                println ("Size of Weather Bonus: \(weatherBonus)")
            }
            var numberOfCustomers = abs(Int(arc4random_uniform(UInt32(10))) + 1 + weatherBonus)
            println ("Number of Customers: \(numberOfCustomers)")
            yesterdayVisitors = numberOfCustomers
            for numberOfCustomers; numberOfCustomers > 0; numberOfCustomers-- {
                myCustomer.customerPreference = randomAcidityPreference()
                println("Customer No. \(customerArray.count + 1) prefers \(myCustomer.customerPreference) Lemonade.")
                if myCustomer.customerPreference == today.acidityLevel {
                    myCustomer.didPurchase = true
                    today.sales++
                    println("Customer No. \(customerArray.count + 1) purchased today's \(today.acidityLevel) Lemonade!")
                }
                customerArray.append(myCustomer)
            }
            
            dayArray.append(today)
            today.weather = randomWeather()
            today.lemonMix = 0
            today.iceMix = 0
            today.acidityLevel = checkLemonadeStrength(today.lemonMix, ice: today.iceMix)
            dayNumber = dayArray.count+1
            today.totalMoney += today.sales
            today.sales = 0
            updateMainView()
            updateYesterdayView()
            if netWorth(today) < (price.lemonPrice + price.icePrice) {
                showAlertWithText(action: "RESTART", header: "Game Over:\nNot Enough Resources", message: "The Lemonade Business is Hard")
                hardReset()
                updateMainView()
                updateYesterdayView()
                
            }
        }
    }
    
    
    // HARD RESET
    
    func hardReset() {
        today = DailyStats(startMoney: 10, startLemons: 1, startIce: 1, startSales: 0, startVisitors: 0, startAcidity: "Unmixed")
        today.iceMix = 0
        today.lemonMix = 0
        dayNumber = 0
        customerArray.removeAll(keepCapacity: true)
        yesterdayVisitors = 0
        dayArray.removeAll(keepCapacity: true)
        
    }
    
    
    // UPDATE MAIN VIEW
    
    func updateMainView () {
        self.lemonsInventoryLabel.text = "\(today.lemonInventory)"
        self.lemonsInventoryLabel.sizeToFit()
        self.lemonsInventoryLabel.center = configCenterPoint(todayInventoryLemonsContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: 13.0, yOffset: 8.0)
        
        self.iceInventoryLabel.text = "\(today.iceInventory)"
        self.iceInventoryLabel.sizeToFit()
        self.iceInventoryLabel.center = configCenterPoint(todayInventoryIceContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: 12.0, yOffset: 9.0)
        
        self.lemonsMixLabel.text = "\(today.lemonMix)"
        self.lemonsMixLabel.sizeToFit()
        self.lemonsMixLabel.center = configCenterPoint(todayMixLemonsContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: 10.0, yOffset: 9.0)
       
        self.iceMixLabel.text = "\(today.iceMix)"
        self.iceMixLabel.sizeToFit()
        self.iceMixLabel.center = configCenterPoint(todayMixAcidityContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: -4.0, yOffset: 9.0)
        
        self.moneyInventoryLabel.text = "$\(today.totalMoney)"
        self.moneyInventoryLabel.sizeToFit()
        self.moneyInventoryLabel.center = configCenterPoint(todayInventoryMoneyContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: 0.0, yOffset: 18.0)
        
        self.acidityMixLabel.text = "\(today.acidityLevel)"
        self.acidityMixLabel.sizeToFit()
        self.acidityMixLabel.center = configCenterPoint(todayMixAcidityContainer, xDivisor: 2.0, yDivisor: 1.25, xOffset: 6.0, yOffset: 12.0)
    }
    
    // UPDATE YESTERDAY (new day) VIEW
    
    func updateYesterdayView () {
        
        if dayNumber > 1 {
            
            println("Starting Day \(dayArray.count+1)")
            
            yesterdayWeatherLabel.hidden = false
            yesterdayAcidityLabel.hidden = false
            yesterdayVisitorsLabel.hidden = false
            yesterdaySalesLabel.hidden = false
            
            yesterdayStartLabel.hidden = true
            
            self.dayLabel.text = "Day \(dayArray.count+1)"
            self.dayLabel.sizeToFit()
            dayLabel.center = todayLabelContainer.center
            
            self.todayWeatherImage.image = today.weather
            self.yesterdayWeatherImage.image = dayArray[dayArray.count-1].weather
            
            self.yesterdayAcidityLabel.text = "\(dayArray[dayArray.count-1].acidityLevel)"
            self.yesterdayAcidityLabel.sizeToFit()
            self.yesterdayAcidityLabel.center = configCenterPoint(yesterdayAcidityContainer, xDivisor: 2.0, yDivisor: 1.35, xOffset: 0.0, yOffset: 0.0)
            
            self.yesterdayVisitorsLabel.text = "\(yesterdayVisitors) Visitors"
            self.yesterdayVisitorsLabel.sizeToFit()
            self.yesterdayVisitorsLabel.center = configCenterPoint(yesterdayVisitorsContainer, xDivisor: 2.0, yDivisor: 1.35, xOffset: 0.0, yOffset: 0.0)
            
            self.yesterdaySalesLabel.text = "$\(dayArray[dayArray.count-1].sales) Sales"
            self.yesterdaySalesLabel.sizeToFit()
            self.yesterdaySalesLabel.center = configCenterPoint(yesterdaySalesContainer, xDivisor: 2.0, yDivisor: 1.35, xOffset: 0.0, yOffset: 0.0)
        } else {
            
            println("Starting Day 1")
            
            yesterdayWeatherLabel.hidden = true
            yesterdayAcidityLabel.hidden = true
            yesterdayVisitorsLabel.hidden = true
            yesterdaySalesLabel.hidden = true
            
            self.dayLabel.text = "Day 1"
            
            yesterdayStartLabel.hidden = false
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupContainerViews() {
        titleLabelContainer = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * myLayoutConstants.kTitleLabelContainerHeight))
        titleLabelContainer.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(titleLabelContainer)
        
        var titlePosition = titleLabelContainer.center
        titlePosition.y += 10
        titleLabel = UILabel()
        configFontLabel(titleLabel, font: myLayoutConstants.defaultFont, fontSize: 24, text: "Lemonade Stand")
        titleLabel.center = titlePosition
        titleLabelContainer.addSubview(titleLabel)
        
        todayContainer = UIView(frame: CGRect(x: 0, y: titleLabelContainer.frame.height, width: self.view.bounds.width, height: self.view.bounds.height * myLayoutConstants.kTodayContainerHeight))
        todayContainer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: (224/255), alpha: 100)
        self.view.addSubview(todayContainer)
        setupTodayContainer(todayContainer)
        
        yesterdayContainer = UIView(frame: CGRect(x: 0, y: titleLabelContainer.frame.height + todayContainer.frame.height, width: self.view.bounds.width, height: self.view.bounds.height * myLayoutConstants.kYesterdayContainerHeight))
        yesterdayContainer.backgroundColor = UIColor(red: (240/255), green: (244/255), blue: (250/255), alpha: 100)
        self.view.addSubview(yesterdayContainer)
        setupYesterdayContainer(yesterdayContainer)
    }
    
    func setupTodayContainer(containerView: UIView) {
        
        // Add todayLabelContainer to todayContainer
        todayLabelContainer = UIView(frame: CGRect(x: 0, y: 0, width: containerView.bounds.width, height: containerView.bounds.height * myLayoutConstants.kRowDayLabel))
        containerView.addSubview(todayLabelContainer)
        
        var titlePosition = todayLabelContainer.center
        
        // Add dayLabel to todayLabelContainer
        dayLabel = UILabel()
        configFontLabel(dayLabel, font: myLayoutConstants.defaultFont, fontSize: 20, text: "Day \(dayNumber+1)")
        dayLabel.center = todayLabelContainer.center
        todayLabelContainer.addSubview(dayLabel)
        
        // Add todayInnventoryContainer to todayContainer
        todayInventoryContainer = UIView(frame: CGRect(x: 0, y: todayLabelContainer.frame.height, width: containerView.bounds.width, height: containerView.bounds.height * myLayoutConstants.kRowInventory))
        containerView.addSubview(todayInventoryContainer)
        
        // Add inventoryLabel to todayInventoryContainer
        titlePosition = todayInventoryContainer.center
        titlePosition.y = 10
        inventoryLabel = UILabel()
        configFontLabel(inventoryLabel, font: myLayoutConstants.defaultFont, fontSize: 18, text: "Today's Inventory")
        inventoryLabel.center = titlePosition
        todayInventoryContainer.addSubview(inventoryLabel)
        
        setupInventoryContainers(todayInventoryContainer)
        
        todayMixContainer = UIView(frame: CGRect(x: 0, y: todayLabelContainer.frame.height + todayInventoryContainer.frame.height, width: containerView.bounds.width, height: containerView.bounds.height * myLayoutConstants.kRowMixLevels))
        containerView.addSubview(todayMixContainer)
        
        titlePosition = todayMixContainer.center
        titlePosition.y = 10
        mixLabel = UILabel()
        configFontLabel(mixLabel, font: myLayoutConstants.defaultFont, fontSize: 18, text: "Today's Special Brew")
        mixLabel.center = titlePosition
        todayMixContainer.addSubview(mixLabel)
        
        setupMixContainers(todayMixContainer)
        
        
        // TODAY'S WEATHER
        
        todayWeatherStartContainer = UIView(frame: CGRect(x: 0, y: todayLabelContainer.frame.height + todayInventoryContainer.frame.height + todayMixContainer.frame.height, width: containerView.bounds.width, height: containerView.bounds.height * myLayoutConstants.kRowStartDay))
        containerView.addSubview(todayWeatherStartContainer)
        
        todayWeatherContainer = UIView(frame: CGRect(x: 0, y: 0, width: todayWeatherStartContainer.bounds.width * myLayoutConstants.kColumnWeatherStart1, height: todayWeatherStartContainer.bounds.height))
        todayWeatherStartContainer.addSubview(todayWeatherContainer)
        
        todayWeatherLabel = UILabel()
        todayWeatherLabel.numberOfLines = 2
        configFontLabel(todayWeatherLabel, font: myLayoutConstants.defaultFont, fontSize: 18, text: "Today's\nWeather")
        todayWeatherLabel.center = configCenterPoint(todayWeatherContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: 0.0, yOffset: 0.0)

        todayWeatherImage = UIImageView()
        todayWeatherImage = configImageView(todayWeatherContainer, myImage: today.weather!, xOffset: 60.0, yOffset: 0.0)
        todayWeatherContainer.addSubview(todayWeatherImage)
        todayWeatherContainer.addSubview(todayWeatherLabel)
        
    
        // START BUTTON
        
        todayStartButtonContainer = UIView(frame: CGRect(x: todayWeatherContainer.frame.width, y: 0, width: todayWeatherStartContainer.bounds.width * myLayoutConstants.kColumnWeatherStart2, height: todayWeatherStartContainer.bounds.height))
        todayWeatherStartContainer.addSubview(todayStartButtonContainer)
        
        startDayButton = UIButton(frame: CGRect(x: 0, y: 0, width: 115, height: 48))
        startDayButton.setImage(myLayoutConstants.startButtonImage?, forState: UIControlState.Normal)
        startDayButton.center = configCenterPoint(todayStartButtonContainer, xDivisor: 2.0, yDivisor: 2.0, xOffset: 0, yOffset: 0)
        startDayButton.addTarget(self, action: "startDayButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        todayStartButtonContainer.addSubview(startDayButton)
    }
    
    
    // INVENTORY CONTAINERS
    
    func setupInventoryContainers(containerView: UIView) {
        
        // INVENTORY MONEY CONTAINTER
        
        todayInventoryMoneyContainer = UIView(frame: CGRect(x: containerView.bounds.width * myLayoutConstants.kColumnBorder, y: 0, width: containerView.bounds.width * myLayoutConstants.kColumnInvMix1, height: containerView.bounds.height))
        
        containerView.addSubview(todayInventoryMoneyContainer)
        
        moneyInventoryLabel = UILabel()
        configFontLabel(moneyInventoryLabel, font: myLayoutConstants.defaultFont, fontSize: 24, text: "$10")
        
        todayInventoryMoneyContainer.addSubview(configImageView(todayInventoryMoneyContainer, myImage: myLayoutConstants.inventoryMoneyImage!, xOffset: 0, yOffset: 0))
        todayInventoryMoneyContainer.addSubview(moneyInventoryLabel)
    
        // INVENTORY LEMONS CONTAINER
        
        todayInventoryLemonsContainer = UIView(frame: CGRect(x: containerView.bounds.width * myLayoutConstants.kColumnBorder + todayInventoryMoneyContainer.bounds.width, y: 0, width: containerView.bounds.width * myLayoutConstants.kColumnInvMix2, height: containerView.bounds.height))
        
        containerView.addSubview(todayInventoryLemonsContainer)
        
        lemonsInventoryLabel = UILabel()
        configFontLabel(lemonsInventoryLabel, font: myLayoutConstants.defaultFont, fontSize: 24, text: "1")
        
        plusLemonInventoryButton = UIButton()
        configButtonText(plusLemonInventoryButton, font: myLayoutConstants.defaultFont, fontSize: 24, text: "+")
        plusLemonInventoryButton.center = configCenterPoint(todayInventoryLemonsContainer, xDivisor: 2.0, yDivisor: 4.0, xOffset: 13.0, yOffset: 5.0)
        plusLemonInventoryButton.addTarget(self, action: "buyLemonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        minusLemonInventoryButton = UIButton()
        configButtonText(minusLemonInventoryButton, font: myLayoutConstants.defaultFont, fontSize: 40, text: "-")
        minusLemonInventoryButton.center = configCenterPoint(todayInventoryLemonsContainer, xDivisor: 2.0, yDivisor: 1.25, xOffset: 13.0, yOffset: 10.0)
        minusLemonInventoryButton.addTarget(self, action: "sellLemonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        todayInventoryLemonsContainer.addSubview(configImageView(todayInventoryLemonsContainer, myImage: myLayoutConstants.inventoryLemonsImage!, xOffset: 0.0, yOffset: 10.0))
        todayInventoryLemonsContainer.addSubview(lemonsInventoryLabel)
        todayInventoryLemonsContainer.addSubview(plusLemonInventoryButton)
        todayInventoryLemonsContainer.addSubview(minusLemonInventoryButton)
        
        
        // INVENTORY ICE CONTAINER
        
        todayInventoryIceContainer = UIView(frame: CGRect(x: containerView.bounds.width * myLayoutConstants.kColumnBorder + todayInventoryMoneyContainer.bounds.width + todayInventoryLemonsContainer.bounds.width, y: 0, width: containerView.bounds.width * myLayoutConstants.kColumnInvMix3, height: containerView.bounds.height))

        containerView.addSubview(todayInventoryIceContainer)
        
        iceInventoryLabel = UILabel()
        configFontLabel(iceInventoryLabel, font: myLayoutConstants.defaultFont, fontSize: 24, text: "1")
        
        plusIceInventoryButton = UIButton()
        configButtonText(plusIceInventoryButton, font: myLayoutConstants.defaultFont, fontSize: 24, text: "+")
        plusIceInventoryButton.center = configCenterPoint(todayInventoryIceContainer, xDivisor: 2.0, yDivisor: 4.0, xOffset: 12.0, yOffset: 5.0)
        plusIceInventoryButton.addTarget(self, action: "buyIcePressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        minusIceInventoryButton = UIButton()
        configButtonText(minusIceInventoryButton, font: myLayoutConstants.defaultFont, fontSize: 40, text: "-")
        minusIceInventoryButton.center = configCenterPoint(todayInventoryIceContainer, xDivisor: 2.0, yDivisor: 1.25, xOffset: 12.0, yOffset: 10.0)
        minusIceInventoryButton.addTarget(self, action: "sellIcePressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        todayInventoryIceContainer.addSubview(configImageView(todayInventoryIceContainer, myImage: myLayoutConstants.inventoryIceImage!, xOffset: 0.0, yOffset: 10.0))
        todayInventoryIceContainer.addSubview(iceInventoryLabel)
        todayInventoryIceContainer.addSubview(plusIceInventoryButton)
        todayInventoryIceContainer.addSubview(minusIceInventoryButton)

    }
    
    // MIX CONTAINERS
    
    func setupMixContainers(containerView: UIView) {
        
        // MIX ACIDITY CONTAINTER
        
        todayMixAcidityContainer = UIView(frame: CGRect(x: containerView.bounds.width * myLayoutConstants.kColumnBorder, y: 0, width: containerView.bounds.width * myLayoutConstants.kColumnInvMix1, height: containerView.bounds.height))

        containerView.addSubview(todayMixAcidityContainer)
        
        acidityMixLabel = UILabel()
        configFontLabel(acidityMixLabel, font: myLayoutConstants.defaultFont, fontSize: 18, text: "\(today.acidityLevel)")
        
        todayMixAcidityContainer.addSubview(configImageView(todayMixAcidityContainer, myImage: myLayoutConstants.mixAcidityImage!, xOffset: 10.0, yOffset: 5.0))
        todayMixAcidityContainer.addSubview(acidityMixLabel)
        
        // MIX LEMONS CONTAINER
        
        todayMixLemonsContainer = UIView(frame: CGRect(x: containerView.bounds.width * myLayoutConstants.kColumnBorder + todayMixAcidityContainer.bounds.width, y: 0, width: containerView.bounds.width * myLayoutConstants.kColumnInvMix2, height: containerView.bounds.height))

        containerView.addSubview(todayMixLemonsContainer)
        
        lemonsMixLabel = UILabel()
        configFontLabel(lemonsMixLabel, font: myLayoutConstants.defaultFont, fontSize: 24, text: "\(today.lemonMix)")
        
        plusLemonMixButton = UIButton()
        configButtonText(plusLemonMixButton, font: myLayoutConstants.defaultFont, fontSize: 24, text: "+")
        plusLemonMixButton.center = configCenterPoint(todayMixLemonsContainer, xDivisor: 2.0, yDivisor: 4.0, xOffset: 12.0, yOffset: 5.0)
        plusLemonMixButton.addTarget(self, action: "addLemonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        minusLemonMixButton = UIButton()
        configButtonText(minusLemonMixButton, font: myLayoutConstants.defaultFont, fontSize: 40, text: "-")
        minusLemonMixButton.center = configCenterPoint(todayMixLemonsContainer, xDivisor: 2.0, yDivisor: 1.25, xOffset: 12.0, yOffset: 10.0)
        minusLemonMixButton.addTarget(self, action: "removeLemonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        todayMixLemonsContainer.addSubview(configImageView(todayMixLemonsContainer, myImage: myLayoutConstants.mixLemonsImage!, xOffset: 10.0, yOffset: 10.0))
        todayMixLemonsContainer.addSubview(lemonsMixLabel)
        todayMixLemonsContainer.addSubview(plusLemonMixButton)
        todayMixLemonsContainer.addSubview(minusLemonMixButton)
        
        // MIX ICE CONTAINER
        
        todayMixIceContainer = UIView(frame: CGRect(x: containerView.bounds.width * myLayoutConstants.kColumnBorder + todayMixAcidityContainer.bounds.width + todayMixLemonsContainer.bounds.width, y: 0, width: containerView.bounds.width * myLayoutConstants.kColumnInvMix3, height: containerView.bounds.height))

        containerView.addSubview(todayMixIceContainer)
        
        iceMixLabel = UILabel()
        configFontLabel(iceMixLabel, font: myLayoutConstants.defaultFont, fontSize: 24, text: "0")
        
        plusIceMixButton = UIButton()
        configButtonText(plusIceMixButton, font: myLayoutConstants.defaultFont, fontSize: 24, text: "+")
        plusIceMixButton.center = configCenterPoint(todayMixIceContainer, xDivisor: 2.0, yDivisor: 4.0, xOffset: 12.0, yOffset: 5.0)
        plusIceMixButton.addTarget(self, action: "addIcePressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        minusIceMixButton = UIButton()
        configButtonText(minusIceMixButton, font: myLayoutConstants.defaultFont, fontSize: 40, text: "-")
        minusIceMixButton.center = configCenterPoint(todayMixIceContainer, xDivisor: 2.0, yDivisor: 1.25, xOffset: 12.0, yOffset: 10.0)
        minusIceMixButton.addTarget(self, action: "removeIcePressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        todayMixIceContainer.addSubview(configImageView(todayMixIceContainer, myImage: myLayoutConstants.mixIceImage!, xOffset: 10.0, yOffset: 10.0))
        todayMixIceContainer.addSubview(iceMixLabel)
        todayMixIceContainer.addSubview(plusIceMixButton)
        todayMixIceContainer.addSubview(minusIceMixButton)
        
    }
    
    // YESTERDAY CONTAINERS
    
    func setupYesterdayContainer(containerView: UIView) {
        
        // YESTERDAY MASTER CONTAINER (Incl. Title Header)
        
        yesterdayResultsLabel = UILabel()
        configFontLabel(yesterdayResultsLabel, font: myLayoutConstants.defaultFont, fontSize: 18, text: "Yesterday's Results")
        yesterdayResultsLabel.center = configCenterPoint(containerView, xDivisor: 2.0, yDivisor: 6.0, xOffset: 0.0, yOffset: 0.0)
        containerView.addSubview(yesterdayResultsLabel)
        
        yesterdayStartLabel = UILabel()
        configFontLabel(yesterdayStartLabel, font: myLayoutConstants.defaultFont, fontSize: 18, text: "Welcome to your new business!")
        yesterdayStartLabel.center = configCenterPoint(yesterdayContainer, xDivisor: 2.0, yDivisor: 1.25, xOffset: 0.0, yOffset: 0.0)
        yesterdayContainer.addSubview(yesterdayStartLabel)
        
        // YESTERDAY WEATHER CONTAINTER
        
        yesterdayWeatherContainer = UIView(frame: CGRect(x: 0, y: 0, width: containerView.bounds.width * myLayoutConstants.kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdayWeatherContainer)
        
        yesterdayWeatherLabel = UILabel()
        configFontLabel(yesterdayWeatherLabel, font: myLayoutConstants.defaultFont, fontSize: 14, text: "Weather")
        yesterdayWeatherLabel.center = configCenterPoint(yesterdayWeatherContainer, xDivisor: 2.0, yDivisor: 1.35, xOffset: 0.0, yOffset: 0.0)
        
        yesterdayWeatherImage = UIImageView()
        yesterdayWeatherImage = configImageView(yesterdayWeatherContainer, myImage: UIImage(named: "Warm")!, xOffset: 0.0, yOffset: 0.0)
        yesterdayWeatherContainer.addSubview(yesterdayWeatherImage)
        yesterdayWeatherContainer.addSubview(yesterdayWeatherLabel)
        
        // YESTERDAY ACIDITY CONTAINTER
        
        yesterdayAcidityContainer = UIView(frame: CGRect(x: yesterdayWeatherContainer.bounds.width, y: 0, width: containerView.bounds.width * myLayoutConstants.kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdayAcidityContainer)
        
        yesterdayAcidityLabel = UILabel()
        configFontLabel(yesterdayAcidityLabel, font: myLayoutConstants.defaultFont, fontSize: 14, text: "Strong")
        yesterdayAcidityLabel.center = configCenterPoint(yesterdayAcidityContainer, xDivisor: 2.0, yDivisor: 1.35, xOffset: 0.0, yOffset: 0.0)
        
        yesterdayAcidityContainer.addSubview(configImageView(yesterdayAcidityContainer, myImage: myLayoutConstants.yesterdayAcidityImage!, xOffset: 0.0, yOffset: 0.0))
        yesterdayAcidityContainer.addSubview(yesterdayAcidityLabel)
        
        // YESTERDAY VISITORS CONTAINTER
        
        yesterdayVisitorsContainer = UIView(frame: CGRect(x: yesterdayWeatherContainer.bounds.width + yesterdayAcidityContainer.bounds.width, y: 0, width: containerView.bounds.width * myLayoutConstants.kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdayVisitorsContainer)
        
        yesterdayVisitorsLabel = UILabel()
        configFontLabel(yesterdayVisitorsLabel, font: myLayoutConstants.defaultFont, fontSize: 14, text: "0 Visitors")
        yesterdayVisitorsLabel.center = configCenterPoint(yesterdayVisitorsContainer, xDivisor: 2.0, yDivisor: 1.35, xOffset: 0.0, yOffset: 0.0)
        
        yesterdayVisitorsContainer.addSubview(configImageView(yesterdayVisitorsContainer, myImage: myLayoutConstants.yesterdayVisitorsImage!, xOffset: 0.0, yOffset: 0.0))
        yesterdayVisitorsContainer.addSubview(yesterdayVisitorsLabel)
        
        // YESTERDAY SALES CONTAINTER
        
        yesterdaySalesContainer = UIView(frame: CGRect(x: yesterdayWeatherContainer.bounds.width + yesterdayAcidityContainer.bounds.width + yesterdayVisitorsContainer.bounds.width, y: 0, width: containerView.bounds.width * myLayoutConstants.kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdaySalesContainer)
        
        yesterdaySalesLabel = UILabel()
        configFontLabel(yesterdaySalesLabel, font: myLayoutConstants.defaultFont, fontSize: 14, text: "$0 Sales")
        yesterdaySalesLabel.center = configCenterPoint(yesterdaySalesContainer, xDivisor: 2.0, yDivisor: 1.35, xOffset: 0.0, yOffset: 0.0)
        
        yesterdaySalesContainer.addSubview(configImageView(yesterdaySalesContainer, myImage: myLayoutConstants.yesterdaySalesImage!, xOffset: 0.0, yOffset: 0.0))
        yesterdaySalesContainer.addSubview(yesterdaySalesLabel)
      
    }
    
    // HELPER FUNCTIONS
    
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
    
    func showAlertWithText (action: String = "OK", header : String = "Warning", message : String) {
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: action, style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func randomAcidityPreference() -> String {
        var myCustomerPreference:String = "Weak"
        
        var randomNumber = Int(arc4random_uniform(UInt32(10)))
        
        if randomNumber <= 4 {
            myCustomerPreference = "Strong"
        } else if randomNumber <= 6 {
            myCustomerPreference = "Neutral"
        }
        
        return myCustomerPreference
    }
    
    func randomWeather() -> UIImage {
        var myWeatherImage = UIImage(named: "Warm")
        
        var randomNumber = Int(arc4random_uniform(UInt32(3)))
        
        if randomNumber == 0 {
            myWeatherImage = UIImage(named: "Mild")
        } else if randomNumber == 1 {
            myWeatherImage = UIImage(named: "Cold")
        }
        
        return myWeatherImage!
    }
    
    func checkLemonadeStrength (lemons: Int, ice: Int) -> String {
        var mixStrength:String
        
        if lemons == 0 || ice == 0 {
            mixStrength = "Unmixed"
        } else if Float(lemons / ice) > 1 {
            mixStrength = "Strong"
        } else if Float(lemons / ice) == 1 {
            mixStrength = "Neutral"
        } else {
            mixStrength = "Weak"
        }
        
        return mixStrength
    }
    
    func netWorth(financialData: DailyStats) -> Int {
        var myNetWorth = financialData.totalMoney + (financialData.lemonInventory * price.lemonPrice) + (financialData.iceInventory * price.icePrice)
        return myNetWorth
    }
    
}

