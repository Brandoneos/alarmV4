//
//  MyTableViewCell.swift
//  alarmV3
//
//  Created by Brandon Kim on 10/22/21.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    var clicked:Bool = false
    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    @IBOutlet var button: UIButton!
    @IBAction func buttonClicked() {
        var image = UIImage(systemName: "checkmark")!
        clicked = true
        if clicked {
            button.setImage(image, for: .normal)
        } else {
            button.setImage(nil, for: .normal)
        }
    }
    func configure(title: String) {
        button.setTitle("   " + title, for: .normal)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.setTitleColor(sG, for: .normal)
        
        // Initialization code
    }

    
    
}
