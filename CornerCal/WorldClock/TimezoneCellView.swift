//
//  TimezoneCellView.swift
//  CornerCal
//
//  Created by Andrew Whalley on 4/26/20.
//  Copyright © 2020 Andrew Whalley. All rights reserved.
//

import Cocoa

class TimezoneCellView: NSTableCellView {

    @IBOutlet weak var timezonePopup: NSPopUpButton?
          
    func populatePopup(withTimezones timezones: [String]) {
        timezonePopup?.addItems(withTitles: timezones)
    }
}
