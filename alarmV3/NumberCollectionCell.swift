//
//  NumberCollectionCell.swift
//  NumberCollectionCell
//
//  Created by Brandon Kim on 8/31/21.
//

import Foundation
import UIKit
class NumberCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    func setup(with indexRow: Int) {
        numberButton.setTitle("\(indexRow)", for: .normal)
        
    }
    
    
    
    
    
}
