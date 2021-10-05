//
//  addAlarm.swift
//  addAlarm
//
//  Created by Brandon Kim on 8/31/21.
//

import UIKit
var springGreen = UIColor(red: 108/255, green: 255/255, blue: 180/255, alpha: 1)
var numbers:[Int] = [1,2,3,4,5,6,7,8,9,14,0,13]

var daysOF:[String] = ["Sunday","Monday","Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
class addAlarm: UIViewController {
    
   
    var selectionsPassed:[Bool] = []
    
    var repeatButtonString = ""
    
    
    @IBOutlet weak var timeView: UIDatePicker!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var repeatButton: UIButton!
    
    @IBOutlet weak var labelButton: UIButton!
    
    @IBOutlet weak var soundButton: UIButton!
    
    @IBOutlet weak var snoozeSwitch: UISwitch!
    @IBOutlet weak var extrasButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        timeView.datePickerMode = .time
        
        
    }
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "ViewController")
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "Repeat")
        
        var date1 = timeView.date
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let datetime = formatter.string(from: date1)
        
        
        if (segue.identifier == "segue1") {
            var secondVCVC:ViewController = segue.destination as! ViewController
            secondVCVC.receivedTime = datetime
            
            secondVC.modalPresentationStyle = .fullScreen
            
            secondVC.modalTransitionStyle = .flipHorizontal
            
            
            
            
            
            
            present(secondVC, animated: true, completion: nil)
            
            
        } else if  segue.identifier == "segue2" {
            var  thirdVCVC:Repeat = segue.destination as! Repeat
            thirdVC.modalPresentationStyle = .popover
            
            thirdVC.modalTransitionStyle = .coverVertical
            
            present(thirdVC, animated: true, completion: nil)
            
        }
        segue
        
       
        
        
        
        
        
        
    }
    
    @IBAction func myUnwindDoer(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func savePressed(_ sender: Any) {
        
       
//                present(secondVC, animated: true, completion: nil)
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
            cell.numberButton.setTitle("", for: .normal)
            var image = UIImage(named: "deleteIcon")
            
            cell.numberButton.setImage(UIImage(systemName: "delete.left"), for: .normal)
            cell.numberButton.tintColor = springGreen
        } else if (dude == 14 ) {
            
            cell.numberButton.setTitle("", for: .normal)
            cell.numberButton.backgroundColor = .white
            cell.numberButton.tintColor = springGreen
        } else {
            cell.numberButton.setTitle("\(dude)", for: .normal)
            cell.numberButton.tintColor = springGreen
        }
            
            return cell
        
        
        
        
        
    }
}





