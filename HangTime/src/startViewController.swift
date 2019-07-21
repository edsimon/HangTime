//
//  startViewController.swift
//  HangTime
//
//  Created by Simon Edvardsson on 07/03/2019.
//  Copyright © 2019 Simon Edvardsson. All rights reserved.
//

import UIKit

class startViewController: UIViewController {
    var ani = AnimateEverything()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func letsgo_button(_ sender: UIButton) {
        performSegue(withIdentifier: "to_main", sender: self)
    }
    
    
    @IBAction func button(_ sender: Any) {
        ani.scaleButton(button: sender as! UIButton, duration: 1, delay: 0.5, xPos: 20, yPos: 20)
    }
    
    
    
    //performSegue(withIdentifier: "from_intro_sc", sender: self)
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
