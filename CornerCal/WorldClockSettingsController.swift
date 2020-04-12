//
//  WorldClockSettingsController.swift
//  CornerCal
//
//  Created by Andrew Whalley on 4/5/20.
//  Copyright © 2020 Andrew Whalley. All rights reserved.
//

import Cocoa


class WorldClockSettingsController: NSObject, NSWindowDelegate, NSComboBoxDataSource, NSComboBoxDelegate {

    @IBOutlet weak var timezoneCombo: NSComboBox!
    
    var timeZoneIdentifiers: [String]
    
    override init() {
        timeZoneIdentifiers = TimeZone.knownTimeZoneIdentifiers
        super.init()
    }
    
    func windowDidBecomeMain(_ notification: Notification) {
        timezoneCombo.usesDataSource = true
        timezoneCombo.delegate = self
        timezoneCombo.dataSource = self
        timezoneCombo.completes = true
    }

    func numberOfItems(in comboBox: NSComboBox) -> Int {
        return timeZoneIdentifiers.count
    }
       
   func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        return timeZoneIdentifiers[index]
   }
       
   func comboBox(aComboBox: NSComboBox, indexOfItemWithStringValue string: String) -> Int{
        return timeZoneIdentifiers.firstIndex(of: string)!
   }

//    func comboBox(_ comboBox: NSComboBox, completedString string: String) -> String? {
//    
//           var returnString = ""
//           for timeZoneIdentifier in timeZoneIdentifiers{
//            if timeZoneIdentifier.commonPrefix(with: string, options: String.CompareOptions.caseInsensitive).lengthOfBytes(using: String.Encoding.utf8) == string.lengthOfBytes(using: String.Encoding.utf8)
//               {
//                   returnString = timeZoneIdentifier
//                   timeZoneIdentifiers(string)
//                   return returnString
//               }
//           }
//           if returnString.isEmpty{
//               timezoneCombo.stringValue = ""
//           }
//           timeZoneIdentifiers(string)
//           return returnString
//       }
    
}
