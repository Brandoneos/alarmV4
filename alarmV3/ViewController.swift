//
//  ViewController.swift
//  alarmV3
//
//  Created by Brandon Kim on 8/19/21.
//

import UIKit
import UserNotifications
import AVFoundation
import AudioToolbox

//n

var sG = UIColor(red: 108.0/255.0, green: 255.0/255.0, blue: 180.0/255.0, alpha: 1.0)
class ViewController: UIViewController, UITableViewDataSource {
    var alarms:[Alarm] = [Alarm(name: "Wake Up", time: "12:12", onOff: true),Alarm(name: "Sleep", time: "00:00", onOff: true),Alarm(name: "Sleep", time: "00:00", onOff: true)]
    
    var receivedTime:String = "1.0"
    var receivedRepeat:String = ""
    var receivedLabel:String = ""
    var receivedSound:String = ""
    var receivedSnooze:Bool = true
    var receivedExtras:String = ""
    var receivedRepeatCollection:[Bool] = []
    
    
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var baritem1: UITabBarItem!
    
    @IBOutlet weak var alarmNavItem: UINavigationItem!
    
   
    
    
    
    
    
    
    var passedAlarm: Alarm!
    var currentView = ViewController.self
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
        myTableView.reloadInputViews()
        
    
        
    }
    
    
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
    
    
    func resetRepeats() {
        defaults1.set(false, forKey: "selection1")
        defaults1.set(false, forKey: "selection2")
        defaults1.set(false, forKey: "selection3")
        defaults1.set(false, forKey: "selection4")
        defaults1.set(false, forKey: "selection5")
        defaults1.set(false, forKey: "selection6")
        defaults1.set(false, forKey: "selection7")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        resetRepeats()
        
        
        
        //
    }
    
    func convertTime(time:String)-> Int {
        
        var t2 = time
        
        
        
        
        
        var sign = 0
        var arrayT:[String] = []
        var arrayTI:[Int] = []
        if t2.contains("P") {
            t2.removeLast()
            t2.removeLast()
            t2.removeLast()
            sign = 1
            if t2.count < 8 {
                t2 = "0" + t2
            }
        } else {
            t2.removeLast()
            t2.removeLast()
            t2.removeLast()
            if t2.count < 8 {
                t2 = "0" + t2
            }
            
        }
        
        
        for i in t2 {
            arrayT.append("\(i)")
            
        }
        arrayT.remove(at: 2)
        arrayT.remove(at: 4)
        
        for i in arrayT {
            var ii = Int(i)!
            arrayTI.append(ii)
        }
        
        if sign == 1 {
            
            if arrayTI[0] != 1 && arrayTI[1] != 2 {
                arrayTI[0] = arrayTI[0] + 1
                arrayTI[1] = arrayTI[1] + 2
            }
        } else {
            
            if arrayTI[0] == 1 && arrayTI[1] == 2 {
                arrayTI[0] = arrayTI[0] - 1
                arrayTI[1] = arrayTI[1] - 2
            }
        }
        
        print(time)
        print(t2)
        print(arrayT)
        print(arrayTI)
        
        
        
        
        var seconds = 60
        return 3
    }
    
    func transferData(Usegue: UIStoryboardSegue) {
        var unwindSegue = Usegue
        var addalarmViewCon:addAlarm = unwindSegue.source as! addAlarm
        var cancelSave = addalarmViewCon.cancelOrSave
        receivedRepeatCollection = addalarmViewCon.selectionsPassed
        
        var date1 = addalarmViewCon.timeView.date
        
        //If statement for which button was pressed(Save or Canceled)
        var soundT = addalarmViewCon.soundTitle
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        let datetime = formatter.string(from: date1)
            
            
            receivedTime = datetime
            
            var te = ""
            if addalarmViewCon.titleField.text == "" {
                te = "Untitled"
            } else {
                te = addalarmViewCon.titleField.text!
            }
            var s = 0
            var endString = ""
            for i in addalarmViewCon.emptyArray {
                
                if addalarmViewCon.repeatButtonString.contains(daysOF[s]) {
                    addalarmViewCon.emptyArray[s] = 1
                }
                endString += "\(addalarmViewCon.emptyArray[s])"
                s += 1

            }
            
            var endInt = Int(endString)!
            
        var newAlarm = Alarm(name: te, time: datetime, onOff: true, switchSchedule: 0, weekly: addalarmViewCon.emptyArray, sound: soundT)
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = newAlarm.name
        content.body = "This is a local notification"
        
        
        var unS = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "coin"))
        content.sound = unS
        
        var numberOfSecondsUntilDate = 3
        
        
        let trigger  = UNTimeIntervalNotificationTrigger(timeInterval:5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        
        center.add(request) { error in
            if error != nil {
                print("Error = \(error?.localizedDescription ?? "error local notification")")
            }
        }
            alarms.append(newAlarm)
            
            myTableView.reloadData()
            myTableView.reloadInputViews()
       
        
    }
    
    @IBAction func myUnwindDoer(unwindSegue: UIStoryboardSegue) {
        
        //cancels with nothing else happening
        
        
    }
    
    @IBAction func unwindSave(unwindSegue: UIStoryboardSegue) {
        
        
        transferData(Usegue: unwindSegue)
        
        
    }
    
    @IBAction func editButton(_ sender: Any) {
        convertTime(time: "2:30:30 PM")
    }
    
    func sortAlarms() {
        
        
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        

    }

//    func getMinutes(var entInt:Int) -> Int{
//        var minutes = entInt % 100
//        return minutes
//    }
//    func getHours(var entInt:Int) -> Int{
//        var hours = entInt / 100
//        return hours
//    }
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
            
//            var minu = "\(getMinutes(var: alarmTime))"
//            var hou = "\(getHours(var: alarmTime))"
//
//            if  minu == "0" {
//                minu = "00"
//            }
//            if Int(hou)! < 10 {
//                hou = "0" + hou
//            }
            
            
            
            cell.textLabel?.text = alarmTime
            
            cell.detailTextLabel?.text = "\(alarmText)"
            return cell
        } else {
            return UITableViewCell()
            // returns blank cell
        }
        
    }
    
    
}

