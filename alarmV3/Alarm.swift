//
//  Alarm.swift
//  Alarm
//
//  Created by Brandon Kim on 8/23/21.
//

import Foundation
class Alarm{
    var name:String
    var time:String
    var onOff:Bool
    var weekly:[Int]
    var switchSchedule:Int
    
    
    init(name:String, time:String, onOff:Bool) {
        self.name = name
        self.time = time
        self.onOff = onOff
        self.weekly = [0,0,0,0,0,0,0]
        self.switchSchedule = 0
    }
    init(name:String, time:String, onOff:Bool, weekly:[Int]) {
        self.name = name
        self.time = time
        self.onOff = onOff
        self.weekly = weekly
        self.switchSchedule = 0
    }
    init(name:String, time:String, onOff:Bool, switchSchedule:Int ) {
        self.name = name
        self.time = time
        self.onOff = onOff
        self.weekly = [0,0,0,0,0,0,0]
        self.switchSchedule = 1
    }
    init(name:String, time:String, onOff:Bool, switchSchedule:Int, weekly:[Int] ) {
        self.name = name
        self.time = time
        self.onOff = onOff
        self.weekly = weekly
        self.switchSchedule = 1
    }
    
}
