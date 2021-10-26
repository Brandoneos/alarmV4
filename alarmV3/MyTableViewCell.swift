//
//  MyTableViewCell.swift
//  alarmV3
//
//  Created by Brandon Kim on 10/22/21.
//

import UIKit

protocol MyTableViewCellDelegate: AnyObject {
    func buttonClicked(with title: String)
    
}



class MyTableViewCell: UITableViewCell {
    
    weak var delegate: MyTableViewCellDelegate?
    
    
    var clicked:Bool = false
    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    @IBOutlet var button: UIButton!
    private var title: String = ""
    
    @IBAction func buttonClicked() {
        
        delegate?.buttonClicked(with: title)
        
        var image = UIImage(systemName: "checkmark")
        var image2 = UIImage(systemName: "poweroff")
        clicked = !clicked
        
        if clicked {
            button.setImage(image, for: .normal)
            print("image")
        } else {
            button.setImage(image2, for: .normal)
            print("nil")
        }
        
        
        
    }
    func configure(title: String) {
        self.title = title
        button.setTitle("   " + title, for: .normal)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.setTitleColor(sG, for: .normal)
        
        // Initialization code
    }

}



