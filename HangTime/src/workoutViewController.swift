//
//  workoutViewController.swift
//  HangTime
//
//  Created by Simon Edvardsson on 07/03/2019.
//  Copyright © 2019 Simon Edvardsson. All rights reserved.
//

import UIKit

class workoutViewController: UIViewController {
    // Labels :
    @IBOutlet weak var wName: UITextField!
    @IBOutlet weak var hangTime: UILabel!
    @IBOutlet weak var rest: UILabel!
    @IBOutlet weak var reps: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    var listOfLabels : [UILabel] = []
    @IBOutlet weak var addButton: RoundedButton!
    
    // Values :
    var hangCounter = 0
    var restCounter = 0
    var repsCounter = 1
    var longRest = 0
    var workout : [[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.array(forKey: "workouts")?.isEmpty ?? false {
            UserDefaults.standard.set([], forKey: "workouts")
        }
        // Do any additional setup after loading the view.
        
    }
    
    // Buttons:
    @IBAction func hangP(_ sender: UIButton) {
        hangCounter += 1
        hangTime.text = "\(hangCounter) Seconds"
    }
    @IBAction func hangM(_ sender: UIButton) {
        hangCounter -= 1
        hangTime.text = "\(hangCounter) Seconds"
        if hangCounter < 0 {
            hangCounter = 0
        }
    }
    @IBAction func restP(_ sender: UIButton) {
        restCounter += 1
        rest.text = "\(restCounter) Seconds"
    }
    @IBAction func restM(_ sender: UIButton) {
        restCounter -= 1
        rest.text = "\(restCounter) Seconds"
        if restCounter < 0 {
            restCounter = 0
        }
    }
    @IBAction func repsP(_ sender: UIButton) {
        repsCounter += 1
        reps.text = "\(repsCounter) reps"
    }
    @IBAction func repsM(_ sender: UIButton) {
        repsCounter -= 1
        reps.text = "\(repsCounter) reps"
        if repsCounter < 1 {
            repsCounter = 1
        }
    }
    
    @IBAction func longRest(_ sender: UIButton) {
        longRest += 30
        if longRest > 240 {
            longRest = 0
        }
        sender.setTitle("\(longRest) sec", for: .normal)
    }
    
    
    
    
    
    @IBAction func okBackButton(_ sender: Any) {
        let tmp : String = wName.text ?? ""
        let name = "w:" + tmp
        addLongRest()
        UserDefaults.standard.set(workout, forKey: name )
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ClearAndBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func add(_ sender: UIButton) {
        createLabel()
        addToWorkout()
    }
    
    func addLongRest(){
        for i in 0...workout.endIndex-1 {
            if i < workout.endIndex-1 {
                workout[i].append(longRest)
            }
            else {
                workout[i].append(15)
            }
        }
        print(workout)
    }
    
    
    func addToWorkout(){
        var tmp :[Int] = []
        for i in 1...repsCounter {
            tmp.append(hangCounter)
            if i <= repsCounter {
                tmp.append(restCounter)
            }
            
        }
        tmp.append(hangCounter)
        workout.append(tmp)
    }
    
    
    
    
    var xPos = 65
    var yPos = 380
    var first = true
    @objc func createLabel(){
        if yPos > 550 {
            xPos += 100
            yPos = 380
        }
        let label = UILabel(frame: CGRect(x: xPos, y: yPos, width: 200, height: 100))
        label.text = "\(hangCounter)/\(restCounter)/\(repsCounter)"
        label.textColor = .gray
        label.font = label.font.withSize(22)
        label.layer.opacity = 0
        self.view.addSubview(label)
        listOfLabels.append(label)
        
        if first {
            UIView.animate(withDuration: 0.5, animations: {
                self.instructionLabel.layer.opacity = 0.7
                self.first = false
            })
        }
        UIView.animate(withDuration: 1, delay:0.25, animations: {
            label.layer.opacity = 1
        })
        yPos += 50
    }
    
    
    
    
    
}
