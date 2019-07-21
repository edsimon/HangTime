//
//  createBars.swift
//  HangTime
//
//  Created by Simon Edvardsson on 14/03/2019.
//  Copyright © 2019 Simon Edvardsson. All rights reserved.
//
//
//import UIKit
//
//class createBars{
//    var bars = []
//    @objc func pressedBar(sender: UIButton){
//        if sender.backgroundColor != .green {
//            sender.backgroundColor = .green
//            sender.layer.opacity = 1
//        }
//        else {
//            sender.backgroundColor = .red
//            sender.layer.opacity = 0.3
//        }
//    }
//    
//    @objc func createBars(total:Int, yPos:Int, touchAktive:Bool){
//        let screenSize = UIScreen.main.bounds
//        let screenWidth = screenSize.width
//        let screenHeight = screenSize.height
//        let width       = Int(screenHeight*0.9)
//        let center      = Int(screenWidth/2)
//        var barWidth :Int
//        
//        if touchAktive { barWidth = 34 }
//        else if total < 8 {barWidth = 34}
//        else {barWidth = width/total-2}
//        
//        let totBarWidth = Int(barWidth+4)
//        let startpos    = center - totBarWidth*total/2 - barWidth
//        
//        for i in 1...total {
//            let bar = UIButton(frame: CGRect(x: startpos + totBarWidth*i, y:yPos, width:barWidth, height:112))
//            bar.backgroundColor = .red
//            bar.layer.opacity = 0
//            bar.layer.cornerRadius = CGFloat(Int(barWidth/2))
//            if touchAktive {
//                bar.setTitle("\(i)", for: .normal)
//                bar.addTarget(self, action: #selector(pressedBar) , for: .touchUpInside)
//            }
//            self.view.addSubview(bar)
//            ani.alphaButton(button: bar, duration: 1, delay: 0, alpha: 0.3  )
//            
//            bars.append(bar)
//        }
//        
//        
//    }
//    
//    @objc func removeBars(){
//        for bar in bars{
//            bar.removeFromSuperview()
//        }
//        bars.removeAll()
//    }
//}

