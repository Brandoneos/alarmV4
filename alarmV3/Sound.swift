//
//  Sound.swift
//  alarmV3
//
//  Created by Brandon Kim on 10/18/21.
//

import Foundation
import UIKit

class Sound:UIViewController {
    var sounds:[String] = []
    
    override func viewDidLoad() {
        let content = UNMutableNotificationContent()
            content.title = "Notification Tutorial"
            content.subtitle = "from ioscreator.com"
            content.body = " Notification triggered"
            //Default sound
            content.sound = UNNotificationSound.default
            //Play custom sound
            content.sound = UNNotificationSound.init(named:UNNotificationSoundName(rawValue: "123.mp3"))
        
        
        
    }
    
    
    
    
}




