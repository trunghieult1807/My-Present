//
//  PlayingScreenViewController.swift
//  My Present
//
//  Created by Apple on 3/1/20.
//  Copyright © 2020 Hieu Le. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController {

    func calculateDateDifference(chosenDate:Date){
        let todaysDate:Date=Date()
        let difference:TimeInterval=todaysDate.timeIntervalSince(chosenDate)/86400
        
        let dateFormat:DateFormatter=DateFormatter()
        dateFormat.dateFormat="MMMM d,yyyy"
        
        let todaysDateString:String=dateFormat.string(from: todaysDate)
        let chosenDateString:String=dateFormat.string(from: chosenDate)
        
        let differenceOutput:String=String(format: "Your birthday is \(chosenDateString)，\nand today is \(todaysDateString) ,\nIt means %1.0f days ago, the world welcomes an angle!", fabs(difference))
        
        outputLabel.text=differenceOutput
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        let rainDroplayer=CustomLayer(filePath: "Raindrop")
        rainDroplayer.frame=CGRect(x: 0.0, y: -70.0, width: view.bounds.width,height: 50.0)
        rainDroplayer.emitterSize = CGSize(width: self.view.bounds.size.width*2, height: 0)
        view.layer.addSublayer(rainDroplayer)
        // Do any additional setup after loading the view, typically from a nib.
            outputLabel.alpha = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIDatePicker {

    var textColor: UIColor? {
        set {
             setValue(newValue, forKeyPath: "textColor")
            }
        get {
             return value(forKeyPath: "textColor") as? UIColor
            }
    }

    var highlightsToday : Bool? {
        set {
             setValue(newValue, forKeyPath: "highlightsToday")
            }
        get {
             return value(forKey: "highlightsToday") as? Bool
            }
    }
}
