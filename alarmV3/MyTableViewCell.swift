//
//  MyTableViewCell.swift
//  alarmV3
//
//  Created by Brandon Kim on 10/22/21.
//

import UIKit

protocol MyTableViewCellDelegate: AnyObject {
    func buttonClicked(with title: String)
    //-> Int
//    func getSounds() -> [String]
    func resetView()
    
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
        
        
//        delegate?.resetView()
        delegate?.buttonClicked(with: title)

       clicked = !clicked
        
        var image = UIImage(systemName: "checkmark")
        var image2 = UIImage(systemName: "poweroff")
        
        
        
        
        if clicked {
            button.setImage(image, for: .normal)
        } else {
            button.setImage(image2, for: .normal)
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



