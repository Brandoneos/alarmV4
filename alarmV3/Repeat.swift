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
    
    
    
    override func viewDidLoad() {
        self.sundayButton.setImage(nil, for: .normal)
        
        sundayButton.contentHorizontalAlignment = .left
    }
    
   
    @IBAction func myUnwindDoer(unwindSegue: UIStoryboardSegue) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        //Needs to pass data of when to repeat to add alarm viewcontroller
        
    }
    
    @IBAction func sundayPressed(_ sender: UIButton) {
        
        
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    
    
    
    
    
    
    
}









