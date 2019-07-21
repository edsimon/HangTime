//
//  mainViewController.swift
//  HangTime
//
//  Created by Simon Edvardsson on 07/03/2019.
//  Copyright © 2019 Simon Edvardsson. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    @IBAction func createWorkout(_ sender: Any) {
        performSegue(withIdentifier: "to_create", sender: self)
    }
    
    @IBAction func startTimer(_ sender: Any) {
        performSegue(withIdentifier: "to_timer", sender: self)
    }
    
    @IBAction func ToStats(_ sender: Any) {
        performSegue(withIdentifier: "to_stats", sender: self)
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
