//
//  ViewController.swift
//  HangTime
//
//  Created by Simon Edvardsson on 06/03/2019.
//  Copyright © 2019 Simon Edvardsson. All rights reserved.



import UIKit

class ViewController: UIViewController {
    var bars = [UIButton]()
    var result : [[Bool]] = []
    var wName : String = "Your Workout!"
    var list = [[1,2]]
    var ani = AnimateEverything()
    var workoutKeys : [String] = []
    var statIsAktive : Bool = false
    var name : String = ""
    var hangTime  = 0
    //var cba = createBars()
    // ============ Bars for finished sets ================================\\
    override func viewDidLoad(){
        change()
    }
    
    
    
    @objc func change(){
        if statIsAktive {
            UIView.animate(withDuration: 0.3, animations: {
                self.result_label.layer.opacity = 0
                self.res1.text = ""
                self.res2.text = ""
                self.res3.text = ""
            })
            removeBars()
        }
        workoutKeys.removeAll()
        let li1 = UserDefaults.standard.dictionaryRepresentation().keys
        for elem in li1 {
            let a = elem.split(separator: ":", maxSplits: 1, omittingEmptySubsequences: true)[0]
            if a == "w" {
                workoutKeys.append(elem)
            }
        }
    }
    
    func removeInformation(){
        for elem in listOfLabels {
            elem.removeFromSuperview()
        }
    }
    //
    var listOfLabels : [UILabel] = []
    @objc func createLabel(tmp:[[Int]]){
        removeInformation()
        listOfLabels.removeAll()
        let xPos = 65
        var yPos = 260
        var delay = 0
        for elem in tmp {
            if yPos > 550 { yPos = 260 }
            
            let label = UILabel(frame: CGRect(x: xPos, y: yPos, width: 300, height: 100))
            let test:String = createWorkoutString(elem:elem)
            label.text = test
            label.textColor = .gray
            label.font = label.font.withSize(22)
            label.layer.opacity = 0
            self.view.addSubview(label)
            listOfLabels.append(label)
            ani.alphaLabel(label: label, duration: 1, delay: 0.25*Double(delay), alpha: 1   )
            yPos += 50
            delay += 1
        }
    }
    
    func createWorkoutString(elem:[Int]) -> String{
        
        let reps = elem.endIndex/2
        let longRest = elem[elem.endIndex-1]
        var rest = 0
        var hang = 0
        if !elem.isEmpty {
            hang = elem[0]
            rest = elem[1]
        }
        return "4f Pocket: \(hang)/\(rest)/\(reps) rest:\(longRest)"
    }

    
    @objc func pressedBar(sender: UIButton){
        if sender.backgroundColor != .green {
            sender.backgroundColor = .green
            sender.layer.opacity = 1
        }
        else {
            sender.backgroundColor = .red
            sender.layer.opacity = 0.3
        }
    }
    
    @objc func createBars(total:Int, yPos:Int, touchAktive:Bool){
        let width       = Int(self.view.frame.size.width*0.9)
        let center      = Int(self.view.frame.size.width/2)
        var barWidth :Int
        
        if touchAktive { barWidth = 34 }
        else if total < 8 {barWidth = 34}
        else {barWidth = width/total-2}
        
        let totBarWidth = Int(barWidth+4)
        let startpos    = center - totBarWidth*total/2 - barWidth
        
        for i in 1...total {
            let bar = UIButton(frame: CGRect(x: startpos + totBarWidth*i, y:yPos, width:barWidth, height:112))
            bar.backgroundColor = .red
            bar.layer.opacity = 0
            bar.layer.cornerRadius = CGFloat(Int(barWidth/2))
            if touchAktive {
                bar.setTitle("\(i)", for: .normal)
                bar.addTarget(self, action: #selector(pressedBar) , for: .touchUpInside)
            }
            self.view.addSubview(bar)
            ani.alphaButton(button: bar, duration: 1, delay: 0, alpha: 0.3  )
            
            bars.append(bar)
        }
        
        
    }
    
    @objc func removeBars(){
        for bar in bars{
            bar.removeFromSuperview()
        }
        bars.removeAll()
    }
    // ===================================================================
    
    /////////////
    // TIMER:  //
    /////////////
    // Timerfunctionality:
    var timer = Timer()
    var seconds = 0
    var timer_active = false
    var pause_button_active = false
    var totalTrainingTime = 0
    var runcount = 0
    var list_timer : [Int] = []
    var indice : Int = 0
    var isToCreateBars : Bool = true
    var hangTimeAktive : Bool = false
    @IBOutlet weak var hangtime: UILabel!
    @IBOutlet weak var result_label: UILabel!
    @IBOutlet weak var res1: UILabel!
    @IBOutlet weak var res2: UILabel!
    @IBOutlet weak var res3: UILabel!
    @IBOutlet weak var workoutName: UILabel!
    
    
    func startTimer(sec : Int){
        seconds = sec
        //runTimer()
    }
    func stopTimer(){
        timer.invalidate()
    }
    
    func reset(){
        let range = workoutKeys.endIndex
        if !workoutKeys.isEmpty {
            for i in 0...range-1 {
    //            tmp = UserDefaults.standard.array(forKey: workoutKeys[indi]) as! [[Int]]
                UserDefaults.standard.removeObject(forKey: workoutKeys[i])
            }
        }
        
    }

    func runTimer(){
        if !timer_active {
            timer = Timer.scheduledTimer(timeInterval: 1
                , target: self
                , selector: #selector(ViewController.updateTimer
                ), userInfo: nil
            , repeats: true)
            timer_active = true
        }
    }
    
    @objc func updateTimer(){
        /*
         Skriv ut sekunderna
         om listan inte är tom ta första elementet ( setet )
         -> om sekunder = 0 och indexet är på sista elementet
            -> ta bort den delen av listan sätt index på noll
         
         
         */
        
        
        time_label.text = "\(seconds) s"
        if !list.isEmpty {
            list_timer = list[0]
            if seconds <= 0 && list_timer.endIndex == indice {
                list.remove(at: 0)
                indice = 0
                isToCreateBars = true
            }
            else if seconds <= 0 && list_timer.endIndex > indice {
                if isToCreateBars {
                    saveStat()
                    removeBars()
                    let size = list[0].endIndex
                    createBars(total: size/2, yPos: 280, touchAktive: true)
                    isToCreateBars = false
                }
                
                if list_timer.endIndex-1 == indice && seconds == 0 && list.endIndex == 1{
                    seconds = 15
                    hangtime.text = "Succesful!"
                }
                seconds = list_timer[indice]
                runTimer()
                indice += 1
                if hangTimeAktive {
                    hangTimeAktive = false
                    if list_timer.endIndex == indice {
                        hangtime.text = "Long rest"
                        hangtime.textColor = .yellow
                    }
                    else {
                        hangtime.text = "Rest"
                        hangtime.textColor = .red
                        totalTrainingTime += seconds
                    }
                    let i = indice/2 - 1
                    bars[i].backgroundColor = .green
                    bars[i].layer.opacity = 1
                }
                else {
                    hangTimeAktive = true
                    hangtime.text = "HangTime"
                    hangtime.textColor = .green
                    hangTime += seconds
                    totalTrainingTime += seconds
                }
            }
            else {
                seconds -= 1
            }
        }

        else{
            saveStat()
            removeBars()
            statSummary()
            var tmp = UserDefaults.standard.array(forKey: "a")
            tmp?.append(result)
            UserDefaults.standard.set(tmp, forKey: "a")
            reverseView()
            timer.invalidate()
            hangtime.text = wName
        }
    }
    
    
    // Save to stats :
    var ind = 0
    func saveStat(){
        var tmp : [Bool] = []
        for bar in bars {
            tmp.append((bar.backgroundColor == .green))
        }
        if !tmp.isEmpty{
            result.append(tmp)
        }
    }
    
    
    
    func statSummary(){
        statIsAktive = true
        var sum = 0
        var tot = 0
        for set in result{
            for bool in set {
                if bool {
                    sum += 1
                }
                tot += 1
            }
        }
        ani.alphaLabel(label: result_label, duration: 1, delay: 0, alpha: 1)
        createBars(total: tot, yPos: 460, touchAktive: false)
        for i in 0...(sum-1) {
            let delay : Double = Double(i)/2
            ani.backgroundButton(button: bars[i], duration: 1, delay: delay, color: .green)
            ani.alphaButton(button: bars[i], duration: 1, delay: delay, alpha: 1)
        }
        res1.text = "time hanging: \(hangTime)s"
        res2.text = "trainingTime: \(totalTrainingTime)s"
        res3.text = "succesfull : \(sum)reps"
        
        // Saves the statistics
        //let timestamp = NSDate().timeIntervalSince1970
//        let tuple = (name,hangTime,totalTrainingTime,sum,tot)

//        let keys = UserDefaults.standard.dictionaryRepresentation().keys
//        if (!keys.contains("data")) {
//            UserDefaults.standard.set([tuple], forKey: "data")
//        }
//        var statistics = UserDefaults.standard.array(forKey: "data")
//        statistics?.append(tuple)
//        print("good so far")
//        //UserDefaults.standard.removeObject(forKey: "data")
//        print("good so far11")
//        UserDefaults.standard.set([], forKey: "data")
//        print("good so far22")
//        let stat2 = UserDefaults.standard.array(forKey: "data") ?? ["hej"]
//        print("good so far33")
//        print(stat2 ?? "  aa a aa   ")
//        print(tuple)
    }
    
    
    //    Buttons:
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        stopTimer()
        change()
    }
    
    var indi = 0
    @IBOutlet weak var changeButton: RoundedButton!
    @IBAction func nextWo(_ sender: UIButton) {
        var maxLoop = 0
        change()
        if !workoutKeys.isEmpty {
            var tmp:[[Int]] = []
            while tmp.isEmpty {
                if indi >= workoutKeys.endIndex-1 {
                    indi = 0
                }
                else {
                    indi += 1
                }
                tmp = UserDefaults.standard.array(forKey: workoutKeys[indi]) as! [[Int]]
                maxLoop += 1
                if maxLoop == 10 {
                    break
                }
            }
            var tp : String = ""
            if indi == workoutKeys.endIndex {
                tp = String(workoutKeys[0])
            }
            else {
                tp = String(workoutKeys[indi])
            }
            tp.removeFirst()
            tp.removeFirst()
            workoutName.text = tp
            name = tp
            list = tmp
            createLabel(tmp : tmp)
        }
    }
    
    @IBOutlet weak var stopbutton: RoundedButton!
    
    @IBOutlet weak var time_slider: UISlider!
    @IBOutlet weak var start_pause_b: UIButton!
    
    
    
    @IBAction func start_pause_b(_ sender: UIButton) {
        seconds = 7
        runTimer()
        removeBars()
        removeInformation()
        UIView.animate(withDuration: 0.3, animations: {
            sender.layer.opacity = 0
            self.stopbutton.layer.opacity = 0
            self.result_label.layer.opacity = 0
            self.res1.text = ""
            self.res2.text = ""
            self.res3.text = ""
            self.workoutName.layer.opacity = 0
            self.changeButton.layer.opacity = 0
            self.hangtime.text = "Get Ready!"
        })
        UIView.animate(withDuration: 1, delay: 0.5, animations: {
            self.time_label.layer.opacity = 0.8
            self.hangtime.layer.opacity = 0.35
            self.time_label.transform = CGAffineTransform(translationX: 0, y: 40)
            self.time_label.font = self.time_label.font.withSize(128)
            
            self.hangtime.transform = CGAffineTransform(translationX: 60, y: 60)
        })
    }
    
    func reverseView(){
        UIView.animate(withDuration: 0.5, animations: {
            self.stopbutton.layer.opacity = 1
            self.start_pause_b.layer.opacity = 1
            self.time_label.layer.opacity = 0
            self.hangtime.layer.opacity = 0
            
            self.time_label.transform = CGAffineTransform.identity
            self.time_label.font = self.time_label.font.withSize(92)
            
            self.hangtime.transform = CGAffineTransform.identity
            self.changeButton.layer.opacity = 0.35
        })
        UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
            //self.workoutName.text = self.wName
            self.workoutName.layer.opacity = 1
        })
        indice = 0
        timer_active = false
    
    }
    
    @IBAction func stop_button(_ sender: Any) {
        reset()
    }
    
    //    Label:
    @IBOutlet weak var time_label: UILabel!
    
 }
