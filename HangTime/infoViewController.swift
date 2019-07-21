//
//  infoViewController.swift
//  HangTime
//
//  Created by Simon Edvardsson on 06/03/2019.
//  Copyright © 2019 Simon Edvardsson. All rights reserved.
//

import UIKit

class infoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func info_sc_close(_ sender: Any) {
        dismiss(animated: true
            , completion: nil)
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
