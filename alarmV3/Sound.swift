//
//  Sound.swift
//  alarmV3
//
//  Created by Brandon Kim on 10/18/21.
//

import Foundation
import UIKit
import AVFoundation
import AudioToolbox



class Sound:UIViewController, UITableViewDataSource {
    var sounds:[String] = ["coin", "bowArrow"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var buttonInCell: UIButton!
    @IBOutlet weak var navBar: UINavigationBar!
    
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
//        let content = UNMutableNotificationContent()
//            content.title = "Notification Tutorial"
//            content.subtitle = "from ioscreator.com"
//            content.body = " Notification triggered"
//            //Default sound
//            content.sound = UNNotificationSound.default
//            //Play custom sound
//            content.sound = UNNotificationSound.init(named:UNNotificationSoundName(rawValue: "123.mp3"))
       
        
        
        //Colors
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.white
        navBar.backgroundColor = UIColor.white
        navBar.tintColor = sG
        navBar.barTintColor = UIColor.white
        
    }
    func audioPlay(soundName:String, fileType:String) {
        let sound = Bundle.main.path(forResource: soundName, ofType: fileType)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            
        }
        catch {
            print(error)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return sounds.count
       // adds the number of items in the array, which is how many rows we would need for the cells.
       //self explanatory,
   }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier) as! MyTableViewCell
//      let alarmTime = sounds[indexPath.row].time
        let alarmText = sounds[indexPath.row]
        cell.configure(title: alarmText)
        cell.delegate = self
            
        cell.detailTextLabel?.textColor = sG
        cell.textLabel?.textColor = sG
        cell.backgroundColor = UIColor.black
            
            
//        cell.textLabel?.text = alarmText
            
//            cell.detailTextLabel?.text = "\(alarmText)"
        return cell
         
           
    }
    @IBAction func myUnwindSound(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    
}

extension Sound: MyTableViewCellDelegate {
    func buttonClicked(with title: String) {
        tableView.reloadData()
        audioPlay(soundName: title, fileType: "mp3")
        audioPlayer.play()
        
        
        
    }
    
    
    
    
}


