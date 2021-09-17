//
//  ViewController.swift
//  alarmV3
//
//  Created by Brandon Kim on 8/19/21.
//

import UIKit
var alarms:[Alarm] = [Alarm(name: "Wake Up", time: 1212, onOff: true),Alarm(name: "Sleep", time: 0000, onOff: true),Alarm(name: "Sleep", time: 0000, onOff: true),Alarm(name: "Sleep", time: 0000, onOff: true),Alarm(name: "Sleep", time: 0000, onOff: true),Alarm(name: "Sleep", time: 0000, onOff: true),Alarm(name: "Sleep", time: 0000, onOff: true),Alarm(name: "Sleep", time: 0000, onOff: true)]
//n


class ViewController: UIViewController, UITableViewDataSource {
    var receivedTime:Int = 0
    var receivedRepeat:String = ""
    var receivedLabel:String = ""
    var receivedSound:String = ""
    var receivedSnooze:Bool = true
    var receivedExtras:String = ""
    
    
    
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var baritem1: UITabBarItem!
    
    @IBOutlet weak var alarmNavItem: UINavigationItem!
    
   
    
    
    
    
    
    var sG = UIColor(red: 108.0/255.0, green: 255.0/255.0, blue: 180.0/255.0, alpha: 1.0)
    var passedAlarm: Alarm!
    var currentView = ViewController.self
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.dataSource = self
        myTableView.backgroundColor = UIColor.black
        navBar.backgroundColor = UIColor.black
        navBar.tintColor = sG
        navBar.barTintColor = UIColor.black
        
        
        alarmNavItem.titleView?.tintColor = sG
        alarmNavItem.titleView?.backgroundColor = sG
        view.backgroundColor = UIColor.black
        self.setNeedsStatusBarAppearanceUpdate()
        baritem1.badgeColor = sG
        
        
    }

    func sortAlarms() {
        
        
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        

    }

    func getMinutes(var entInt:Int) -> Int{
        var minutes = entInt % 100
        return minutes
    }
    func getHours(var entInt:Int) -> Int{
        var hours = entInt / 100
        return hours
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
        // adds the number of items in the array, which is how many rows we would need for the cells.
        //self explanatory,
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")! but can crash
        //you can spell it wrong
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "myCell"){
            // takes the index of the cell and matches it with the index of the array, places name in correct cell number
            //[] is for the index number which would be the same as the array, the .name is from the Item class, which gets the string of the item.
            let alarmTime = alarms[indexPath.row].time
            let alarmText = alarms[indexPath.row].name
            
            cell.detailTextLabel?.textColor = sG
            cell.textLabel?.textColor = sG
            cell.backgroundColor = UIColor.black
            
            var minu = "\(getMinutes(var: alarmTime))"
            var hou = "\(getHours(var: alarmTime))"
            
            if  minu == "0" {
                minu = "00"
            }
            if Int(hou)! < 10 {
                hou = "0" + hou
            }
            
            
            
            cell.textLabel?.text = "\(hou)" +  ":" + minu
            
            cell.detailTextLabel?.text = "\(alarmText)"
            return cell
        } else {
            return UITableViewCell()
            // returns blank cell
        }
        
    }
    
    
}

