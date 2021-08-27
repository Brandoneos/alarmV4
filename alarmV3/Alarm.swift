//
//  Alarm.swift
//  Alarm
//
//  Created by Brandon Kim on 8/23/21.
//

import Foundation
class Alarm{
    var name:String
    var time:Int
    var onOff:Bool
    var weekly:Int
    var switchSchedule:Int
    
    
    init(name:String, time:Int, onOff:Bool) {
        self.name = name
        self.time = time
        self.onOff = true
        self.weekly = 0
        self.switchSchedule = 0
    }
    init(name:String, time:Int, onOff:Bool, weekly:Int) {
        self.name = name
        self.time = time
        self.onOff = true
        self.weekly = 1
        self.switchSchedule = 0
    }
    init(name:String, time:Int, onOff:Bool, switchSchedule:Int ) {
        self.name = name
        self.time = time
        self.onOff = true
        self.weekly = 0
        self.switchSchedule = 1
    }
    
    
}
