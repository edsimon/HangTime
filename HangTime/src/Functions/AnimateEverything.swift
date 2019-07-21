//
//  AnimateEverything.swift
//  HangTime
//
//  Created by Simon Edvardsson on 14/03/2019.
//  Copyright © 2019 Simon Edvardsson. All rights reserved.
//
//  Animates buttons and labels .

import UIKit

class AnimateEverything {

    // Scale Button & Label
    func scaleButton(button:UIButton, duration:Double, delay:Double, xPos:Float, yPos:Float){
        UIView.animate(withDuration:duration, delay:delay, animations: {
            button.transform = CGAffineTransform(scaleX: CGFloat(xPos), y: CGFloat(yPos))
        })
    }
    func scaleLabel(label:UILabel, duration:Double, delay:Double, xPos:Float, yPos:Float){
        UIView.animate(withDuration:duration, delay:delay, animations: {
            label.transform = CGAffineTransform(scaleX: CGFloat(xPos), y: CGFloat(yPos))
        })
    }
    
    
    // Translate Button & Label
    func translateButton(button:UIButton, duration:Double, delay:Double, xPos:Float, yPos:Float){
        UIView.animate(withDuration:duration, delay:delay, animations: {
            button.transform = CGAffineTransform(translationX: CGFloat(xPos), y: CGFloat(yPos))
        })
    }
    func translateLabel(label:UILabel, duration:Double, delay:Double, xPos:Float, yPos:Float){
        UIView.animate(withDuration:duration, delay:delay, animations: {
            label.transform = CGAffineTransform(translationX: CGFloat(xPos), y: CGFloat(yPos))
        })
    }
    
    
    // Rotate Button & Label
    func rotateButton(button:UIButton, duration:Double, delay:Double, degre:Double){
        UIView.animate(withDuration:duration, delay:delay, animations: {
            button.transform = CGAffineTransform(rotationAngle: CGFloat(degre))
        })
    }
    func rotateLabel(label:UILabel, duration:Double, delay:Double, degre:Double){
        UIView.animate(withDuration:duration, delay:delay, animations: {
            label.transform = CGAffineTransform(rotationAngle: CGFloat(degre))
        })
    }
    
    
    // Remove Button & Label
    func alphaButton(button:UIButton, duration:Double, delay:Double, alpha:Double){
        UIView.animate(withDuration:duration, delay:delay, animations: {
            button.alpha = CGFloat(alpha)
        })
    }
    func alphaLabel(label:UILabel, duration:Double, delay:Double, alpha:Double){
        UIView.animate(withDuration:duration, delay:delay, animations: {
            label.alpha = CGFloat(alpha)
        })
    }
    
    
    // Change Background
    func backgroundButton(button:UIButton, duration:Double, delay:Double, color:UIColor){
        UIView.animate(withDuration:duration, delay:delay, animations: {
            button.backgroundColor = color
        })
    }
    func backgroundLabel(label:UILabel, duration:Double, delay:Double, color:UIColor){
        UIView.animate(withDuration:duration, delay:delay, animations: {
            label.backgroundColor = color
        })
    }
    
    
    
    


}
