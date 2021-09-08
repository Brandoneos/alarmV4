//
//  addAlarm.swift
//  addAlarm
//
//  Created by Brandon Kim on 8/31/21.
//

import UIKit

var numbers:[Int] = [1,2,3,4,5,6,7,8,9,14,0,13]

class AddAlarm: UIViewController {
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }

    @IBAction func savePressed(_ sender: Any) {
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
    }
    
    
    
    
    
    

}
extension UIViewController: UICollectionViewDataSource {
    
    
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
        
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ccell", for: indexPath) as! NumberCollectionCell
            var dude = numbers[indexPath.row]
        if (dude == 13) {
            cell.numberButton.setTitle("hi", for: .normal)
            cell.numberButton.setImage(, for: .normal)
            
            
            
        } else if dude == 14{
            cell.numberButton.setTitle("", for: .normal)
        } else {
            cell.numberButton.setTitle("\(dude)", for: .normal)
            
        }
            
            return cell
        
        
        
        
        
    }
}





