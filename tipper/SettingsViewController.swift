//
//  SettingsViewController.swift
//  tipper
//
//  Created by Jay Tong on 9/14/16.
//  Copyright © 2016 Jay Tong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let indexValue = defaults.integer(forKey: "cookieMonster")
        setDefaultTip.selectedSegmentIndex = indexValue
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var setDefaultTip: UISegmentedControl!
    
    @IBAction func setDefaultTip(_ sender: AnyObject) {
        let indexValue = setDefaultTip.selectedSegmentIndex
        
        let defaults = UserDefaults.standard
        defaults.set(indexValue, forKey: "cookieMonster")
        print(defaults.integer(forKey: "cookieMonster"))

        
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
