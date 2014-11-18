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
    var todayInventoryMoneyContainer: UIImageView!
    var todayInventoryLemonsContainer: UIImageView!
    var todayInventoryIceContainer: UIImageView!
    // -- todayMixContainer Sub-Views --
    var todayMixContainer: UIView!
    var todayMixAcidityContainer: UIImageView!
    var todayMixLemonsContainer: UIImageView!
    var todayMixIceContainer: UIImageView!
    // -- todayWeatherContainer Sub-Views --
    var todayWeatherStartContainer: UIView!
    var todayWeatherContainer: UIView!
    var todayStartButtonContainer: UIImageView!
    // -- yesterdayResultsContainer Sub-Views --
    var yesterdayWeatherContainer: UIImageView!
    var yesterdayAcidityContainer: UIImageView!
    var yesterdayVisitorsContainer: UIImageView!
    var yesterdaySalesContainer: UIImageView!
    
    
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
        
        yesterdayContainer = UIView(frame: CGRect(x: 0, y: titleLabelContainer.frame.height + todayContainer.frame.height, width: self.view.bounds.width, height: self.view.bounds.height * kTodayContainerHeight))
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
    
    
    func setupInventoryContainers(containerView: UIView) {
        todayInventoryMoneyContainer = UIImageView(frame: CGRect(x: containerView.bounds.width * kColumnBorder, y: 20, width: 107.0, height: 104.0))
        containerView.addSubview(todayInventoryMoneyContainer)
        
        var titlePosition = todayInventoryMoneyContainer.center
        titlePosition.x = todayInventoryMoneyContainer.bounds.width/2
        titlePosition.y -= 3
        moneyInventoryLabel = UILabel()
        configPrimaryFontLabel(moneyInventoryLabel, fontSize: 18, text: "$10")
        moneyInventoryLabel.center = titlePosition
        
        todayInventoryMoneyContainer.image = UIImage(named: "Star Icon")
        todayInventoryMoneyContainer.addSubview(moneyInventoryLabel)
        
        todayInventoryLemonsContainer = UIImageView(frame: CGRect(x: ((containerView.bounds.width * kColumnBorder) + todayInventoryMoneyContainer.bounds.width), y: todayInventoryContainer.bounds.height/2-15, width: 75.0, height: 54.0))
        containerView.addSubview(todayInventoryLemonsContainer)
        
        titlePosition = todayInventoryLemonsContainer.center
        titlePosition.x = todayInventoryLemonsContainer.bounds.width/2+13
        titlePosition.y = todayInventoryLemonsContainer.bounds.height/2
        lemonsInventoryLabel = UILabel()
        configPrimaryFontLabel(lemonsInventoryLabel, fontSize: 24, text: "1")
        lemonsInventoryLabel.center = titlePosition
        
        todayInventoryLemonsContainer.image = UIImage(named: "Lemon Inventory Icon")
        todayInventoryLemonsContainer.addSubview(lemonsInventoryLabel)
        
        todayInventoryIceContainer = UIImageView(frame: CGRect(x: (containerView.bounds.width * kColumnBorder + todayInventoryMoneyContainer.bounds.width + todayInventoryLemonsContainer.bounds.width + 5), y: todayInventoryContainer.bounds.height/2-15, width: 80, height: 55))
        containerView.addSubview(todayInventoryIceContainer)
        
        titlePosition = todayInventoryIceContainer.center
        titlePosition.x = todayInventoryIceContainer.bounds.width/2+13
        titlePosition.y = todayInventoryIceContainer.bounds.height/2
        iceInventoryLabel = UILabel()
        configPrimaryFontLabel(iceInventoryLabel, fontSize: 24, text: "1")
        iceInventoryLabel.center = titlePosition
        
        todayInventoryIceContainer.image = UIImage(named: "Ice Inventory Icon")
        todayInventoryIceContainer.addSubview(iceInventoryLabel)
        
        
    }
    
    func setupMixContainers(containerView: UIView) {
        
        todayMixAcidityContainer = UIImageView(frame: CGRect(x: containerView.bounds.width * kColumnBorder, y: 0, width: containerView.bounds.width * kColumnInvMix1, height: containerView.bounds.height))
        containerView.addSubview(todayMixAcidityContainer)
        
        var titlePosition = self.todayMixAcidityContainer.center
        titlePosition.x = todayMixAcidityContainer.bounds.width/2
        acidityMixLabel = UILabel()
        configPrimaryFontLabel(acidityMixLabel, fontSize: 18, text: "Acidity")
        acidityMixLabel.center = titlePosition
        todayMixAcidityContainer.addSubview(acidityMixLabel)
        
        todayMixLemonsContainer = UIImageView(frame: CGRect(x: ((containerView.bounds.width * kColumnBorder) + todayMixAcidityContainer.bounds.width), y: 0, width: containerView.bounds.width * kColumnInvMix2, height: containerView.bounds.height))
        containerView.addSubview(todayMixLemonsContainer)
        
        titlePosition = self.todayMixLemonsContainer.center
        titlePosition.x = todayMixLemonsContainer.bounds.width/2
        lemonsMixLabel = UILabel()
        configPrimaryFontLabel(lemonsMixLabel, fontSize: 18, text: "Lemons")
        lemonsMixLabel.center = titlePosition
        todayMixLemonsContainer.addSubview(lemonsMixLabel)
        
        todayMixIceContainer = UIImageView(frame: CGRect(x: (containerView.bounds.width * kColumnBorder + todayMixAcidityContainer.bounds.width + todayMixLemonsContainer.bounds.width), y: 0, width: containerView.bounds.width * kColumnInvMix3, height: containerView.bounds.height))
        containerView.addSubview(todayMixIceContainer)
        
        titlePosition = self.todayMixIceContainer.center
        titlePosition.x = todayMixIceContainer.bounds.width/2
        iceMixLabel = UILabel()
        configPrimaryFontLabel(iceMixLabel, fontSize: 18, text: "Ice Cubes")
        iceMixLabel.center = titlePosition
        todayMixIceContainer.addSubview(iceMixLabel)
        
    }
    
    func setupYesterdayContainer(containerView: UIView) {
        
        var titlePosition = containerView.center
        titlePosition.y = 15
        yesterdayResultsLabel = UILabel()
        configPrimaryFontLabel(yesterdayResultsLabel, fontSize: 18, text: "Yesterday's Results")
        yesterdayResultsLabel.center = titlePosition
        containerView.addSubview(yesterdayResultsLabel)
        
        yesterdayWeatherContainer = UIImageView(frame: CGRect(x: 0, y: 0, width: containerView.bounds.width * kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdayWeatherContainer)
        
        titlePosition = yesterdayWeatherContainer.center
        titlePosition.x = yesterdayWeatherContainer.bounds.width/2
        titlePosition.y = yesterdayWeatherContainer.bounds.height/6
        yesterdayWeatherLabel = UILabel()
        configPrimaryFontLabel(yesterdayWeatherLabel, fontSize: 14, text: "Weather")
        yesterdayWeatherLabel.center = titlePosition
        yesterdayWeatherContainer.addSubview(yesterdayWeatherLabel)
        
        yesterdayAcidityContainer = UIImageView(frame: CGRect(x: yesterdayWeatherContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdayAcidityContainer)
        
        titlePosition = yesterdayAcidityContainer.center
        titlePosition.x = yesterdayAcidityContainer.bounds.width/2
        titlePosition.y = yesterdayAcidityContainer.bounds.height/6
        yesterdayAcidityLabel = UILabel()
        configPrimaryFontLabel(yesterdayAcidityLabel, fontSize: 14, text: "Acidity")
        yesterdayAcidityLabel.center = titlePosition
        yesterdayAcidityContainer.addSubview(yesterdayAcidityLabel)
        
        yesterdayVisitorsContainer = UIImageView(frame: CGRect(x: yesterdayWeatherContainer.bounds.width + yesterdayAcidityContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdayVisitorsContainer)
        
        titlePosition = yesterdayVisitorsContainer.center
        titlePosition.x = yesterdayVisitorsContainer.bounds.width/2
        titlePosition.y = yesterdayVisitorsContainer.bounds.height/6
        yesterdayVisitorsLabel = UILabel()
        configPrimaryFontLabel(yesterdayVisitorsLabel, fontSize: 14, text: "Visitors")
        yesterdayVisitorsLabel.center = titlePosition
        yesterdayVisitorsContainer.addSubview(yesterdayVisitorsLabel)
        
        yesterdaySalesContainer = UIImageView(frame: CGRect(x: yesterdayWeatherContainer.bounds.width + yesterdayAcidityContainer.bounds.width + yesterdayVisitorsContainer.bounds.width, y: 0, width: containerView.bounds.width * kColumnYesterday, height: containerView.bounds.height))
        containerView.addSubview(yesterdaySalesContainer)
        
        titlePosition = yesterdaySalesContainer.center
        titlePosition.x = yesterdaySalesContainer.bounds.width/2
        titlePosition.y = yesterdaySalesContainer.bounds.height/6
        yesterdaySalesLabel = UILabel()
        configPrimaryFontLabel(yesterdaySalesLabel, fontSize: 14, text: "Sales")
        yesterdaySalesLabel.center = titlePosition
        yesterdaySalesContainer.addSubview(yesterdaySalesLabel)
        
    }
    
    
    func configPrimaryFontLabel(label: UILabel, fontSize: CGFloat, text: String) -> UILabel {
        var formattedLabel:UILabel = label
        formattedLabel.textColor = UIColor.blackColor()
        formattedLabel.font = UIFont(name: "BradleyHandITCTT-Bold", size: fontSize)
        formattedLabel.text = text
        formattedLabel.sizeToFit()
        
        return formattedLabel
    }
    
}

