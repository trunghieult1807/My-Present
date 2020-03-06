//
//  PlayingScreenViewController.swift
//  My Present
//
//  Created by Apple on 3/1/20.
//  Copyright © 2020 Hieu Le. All rights reserved.
//

import UIKit

class GetUpViewController: UIViewController {

    @IBAction func callBoyFriend(_ sender: AnyObject) {
        UIApplication.shared.openURL(NSURL(string: "tel://0703799116") as! URL)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
