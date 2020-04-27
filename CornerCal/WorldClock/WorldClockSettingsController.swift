//
//  WorldClockSettingsController.swift
//  CornerCal
//
//  Created by Andrew Whalley on 4/5/20.
//  Copyright © 2020 Andrew Whalley. All rights reserved.
//

import Cocoa


class WorldClockSettingsController: NSViewController, NSWindowDelegate {

    @IBOutlet weak var table: NSTableView!
    
    @IBOutlet weak var addButton: NSButton!
    
    @IBOutlet weak var removeButton: NSButton!
    
    var cities: [City] = []
    var timezones: [String] = []
    

    override func viewDidLoad() {
        let city = City(timezone: TimeZone(abbreviation: "CET")!, Description: "Berlin")
        cities.append(city)
        timezones = TimeZone.knownTimeZoneIdentifiers

        table.delegate = self
        table.dataSource = self
    }
    

    override func viewWillAppear() {
        super.viewWillAppear()
        table.reloadData()
    }
    
    @IBAction func addCity(_ sender: Any) {
        let city = City(timezone: TimeZone(abbreviation: "CET")!, Description: "-")
        cities.append(city)
        table.reloadData()
    }
    
    @IBAction func removeCity(_ sender: Any) {
        if table.selectedRow >= 0 && table.selectedRow < cities.count {
            cities.remove(at: table.selectedRow)
            table.reloadData()
        }
    }
    
}

extension WorldClockSettingsController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return cities.count
    }
}


extension WorldClockSettingsController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let currentCity = cities[row]
      
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "timezoneColumn") {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "timezoneCell")
            let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as! TimezoneCellView
            cellView.populatePopup(withTimezones: timezones)
            return cellView
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "descriptionColumn") {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "descriptionCell")
            let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as! NSTableCellView
            cellView.textField?.stringValue = currentCity.Description
            return cellView
        }
        return nil
    }
}


 
