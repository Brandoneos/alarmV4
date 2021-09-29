//
//  Repeat.swift
//  Repeat
//
//  Created by Brandon Kim on 9/21/21.
//

import Foundation
import UIKit

class Repeat: UIViewController {
    @IBOutlet weak var sundayButton: UIButton!
    @IBOutlet weak var mondayButton: UIButton!
    
    @IBOutlet weak var tuesdayButton: UIButton!
    
    @IBOutlet weak var wednesdayButton: UIButton!
    
    @IBOutlet weak var thursdayButton: UIButton!
    
    @IBOutlet weak var fridayButton: UIButton!
    
    @IBOutlet weak var saturdayButton: UIButton!
    
    
    var theImage:UIImage = UIImage(systemName: "checkmark")!
    var selection1:Bool = false
    var selection2:Bool = false
    var selection3:Bool = false
    var selection4:Bool = false
    var selection5:Bool = false
    var selection6:Bool = false
    var selection7:Bool = false
    var selections:[Bool] = []
    
    override func viewDidLoad() {
        
        
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if selection1 {
            sundayButton.setImage(UIImage(systemName: "checkmark.seal.fill")!, for: .normal)
        } else {
            sundayButton.setImage(UIImage(systemName: "checkmark.seal")!, for: .normal)
        }
        
        //trying to make choices saved
        
        
        
    }
    
   
    @IBAction func myUnwindDoer(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        selections = [selection1,selection2,selection3,selection4,selection5,selection6,selection7]
        
        var VC1:addAlarm = segue.destination as! addAlarm
        
        
        VC1.selectionsPassed = selections
        VC1.repeatButtonString = ""
        if VC1.selectionsPassed.isEmpty {
            VC1.repeatButton.setTitle("Repeat" + "(Never)", for: .normal)
        } else {
            var start = 0
            for i in VC1.selectionsPassed {
                
                if i == true {
                    
                    VC1.repeatButtonString += daysOF[start]
                    
                    VC1.repeatButtonString += ","
                }
                
                start += 1
            }
            
            
            VC1.repeatButton.setTitle("Repeat" + "(" + "\(VC1.repeatButtonString)" + ")", for: .normal)
            
        }
        
        
        
        
        
        
        //Needs to pass data of when to repeat to add alarm viewcontroller
        
    }
    
    @IBAction func sundayPressed(_ sender: UIButton) {
        
        
        if selection1 {
            selection1 = !selection1
            
            theImage = UIImage(systemName: "checkmark.seal")!
            sundayButton.setImage(theImage, for: .normal)
            sundayButton.reloadInputViews()
            
            
        } else {
            selection1 = !selection1

            theImage = UIImage(systemName: "checkmark.seal.fill")!
            sundayButton.setImage(theImage, for: .normal)
            sundayButton.reloadInputViews()
            
            
        }
    }
    
    @IBAction func mondayPressed(_ sender: UIButton) {
        if selection2 {
            selection2 = !selection2
           
            theImage = UIImage(systemName: "checkmark.seal")!
            mondayButton.setImage(theImage, for: .normal)
            mondayButton.reloadInputViews()
            
            
        } else {
            selection2 = !selection2

            theImage = UIImage(systemName: "checkmark.seal.fill")!
            mondayButton.setImage(theImage, for: .normal)
            mondayButton.reloadInputViews()
            
            
        }
    }
    
    @IBAction func tuesdayPressed(_ sender: UIButton) {
        if selection3 {
            selection3 = !selection3
            
            theImage = UIImage(systemName: "checkmark.seal")!
            tuesdayButton.setImage(theImage, for: .normal)
            tuesdayButton.reloadInputViews()
            
            
        } else {
            selection3 = !selection3

            theImage = UIImage(systemName: "checkmark.seal.fill")!
            tuesdayButton.setImage(theImage, for: .normal)
            tuesdayButton.reloadInputViews()
            
            
        }
    }
    
    @IBAction func wednesdayPressed(_ sender: UIButton) {
        if selection4 {
            selection4 = !selection4
            
            theImage = UIImage(systemName: "checkmark.seal")!
            wednesdayButton.setImage(theImage, for: .normal)
            wednesdayButton.reloadInputViews()
            
            
        } else {
            selection4 = !selection4

            theImage = UIImage(systemName: "checkmark.seal.fill")!
            wednesdayButton.setImage(theImage, for: .normal)
            wednesdayButton.reloadInputViews()
            
            
        }
    }
    
    @IBAction func thursdayPressed(_ sender: UIButton) {
        if selection5 {
            selection5 = !selection5
            
            theImage = UIImage(systemName: "checkmark.seal")!
            thursdayButton.setImage(theImage, for: .normal)
            thursdayButton.reloadInputViews()
            
            
        } else {
            selection5 = !selection5

            theImage = UIImage(systemName: "checkmark.seal.fill")!
            thursdayButton.setImage(theImage, for: .normal)
            thursdayButton.reloadInputViews()
            
            
        }
    }
    
    @IBAction func fridayPressed(_ sender: UIButton) {
        if selection6 {
            selection6 = !selection6
            
            theImage = UIImage(systemName: "checkmark.seal")!
            fridayButton.setImage(theImage, for: .normal)
            fridayButton.reloadInputViews()
            
            
        } else {
            selection6 = !selection6

            theImage = UIImage(systemName: "checkmark.seal.fill")!
            fridayButton.setImage(theImage, for: .normal)
            fridayButton.reloadInputViews()
            
            
        }
    }
    
    @IBAction func saturdayPressed(_ sender: UIButton) {
        if selection7 {
            selection7 = !selection7
            
            theImage = UIImage(systemName: "checkmark.seal")!
            saturdayButton.setImage(theImage, for: .normal)
            saturdayButton.reloadInputViews()
            
            
        } else {
            selection7 = !selection7

            theImage = UIImage(systemName: "checkmark.seal.fill")!
            saturdayButton.setImage(theImage, for: .normal)
            saturdayButton.reloadInputViews()
            
            
        }
    }
    
    
    
    
    
    
}









