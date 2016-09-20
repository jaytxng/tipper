//
//  ViewController.swift
//  tipper
//
//  Created by Jay Tong on 9/14/16.
//  Copyright © 2016 Jay Tong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billName: UILabel!
    @IBOutlet weak var tipName: UILabel!
    @IBOutlet weak var totalName: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol
        
        let tipPercentages = [0.15, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String (format: "\(currencySymbol!)%.2f", tip)
        totalLabel.text = String (format: "\(currencySymbol!)%.2f", total)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let indexValue = defaults.integer(forKey: "cookieMonster")
        tipControl.selectedSegmentIndex = indexValue
        
        calculateTip(self)
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]

        billName.center.x  -= view.bounds.width
        tipName.center.x  -= view.bounds.width
        totalName.center.x  -= view.bounds.width

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.billField.becomeFirstResponder()
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.curveEaseOut], animations: {
                self.billName.center.x += self.view.bounds.width
                self.tipName.center.x += self.view.bounds.width
                self.totalName.center.x += self.view.bounds.width
                }, completion: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

}

