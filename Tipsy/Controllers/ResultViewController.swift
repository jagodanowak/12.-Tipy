//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Jagoda Nowak on 25/10/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var tip: Float?
    var people: Float?
    var tipPct: Float?
    
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsLabel.text = "Split between \(Int(people!)) people, with \(Int(tipPct! * 100)-100)% tip."
        
        totalLabel.text = String(format: "%.2f", tip ?? "0.00")
        

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
