//
//  ViewController.swift
//  335Game
//
//  Created by Katie Simonson on 4/28/20.
//  Copyright © 2020 mjsimons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer?
    var timeLeft: Double = 10.0
    var canClick: Bool = true
    var countingDown: Bool = false
    
    @IBOutlet weak var apple1: UIImageView!
    @IBOutlet weak var apple2: UIImageView!
    @IBOutlet weak var apple3: UIImageView!
    @IBOutlet weak var apple4: UIImageView!
    @IBOutlet weak var monkey: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func up(_ sender: Any) {
        if(canClick){
            if(!countingDown){
                countingDown = true
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:     #selector(ViewController.countdown), userInfo: nil, repeats: true)
            }
        
            monkey.frame.origin.y -= 10
            update(monkeyView: monkey)
        }
    }
    
    @IBAction func down(_ sender: Any) {
        if(canClick){
            if(!countingDown){
                countingDown = true
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
            }
        
            monkey.frame.origin.y += 10
            update(monkeyView: monkey)
        }
    }
    
    @IBAction func right(_ sender: Any) {
        if(canClick){
            if(!countingDown){
                countingDown = true
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
            }
        
            monkey.frame.origin.x += 10
            update(monkeyView: monkey)
        }
    }
    
    @IBAction func left(_ sender: Any) {
        if(canClick){
            if(!countingDown){
                countingDown = true
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
            }
        
            monkey.frame.origin.x -= 10
            update(monkeyView: monkey)
        }
    }
    
    @objc func countdown(){
        timeLeft -= 0.1
        statusLabel.text = String(format: "%.1f", timeLeft)
        
        if(timeLeft <= 0.0){
            timer?.invalidate()
            statusLabel.text = "Monkey failed his task"
            countingDown = false
            canClick = false
        }
    }
    
    
    func update(monkeyView: UIView){
        //apple1
        if(monkeyView.frame.intersects(apple1.frame)){
            apple1.isHidden = true
        }
        
        //apple2
        else if(monkeyView.frame.intersects(apple2.frame)){
            apple2.isHidden = true
        }
        
        //apple3
        else if(monkeyView.frame.intersects(apple3.frame)){
            apple3.isHidden = true
        }
        
        //apple4
        else if(monkeyView.frame.intersects(apple4.frame)){
            apple4.isHidden = true
        }
        
        //check if game is completed
        if(apple1.isHidden && apple2.isHidden && apple3.isHidden && apple4.isHidden){
            timer?.invalidate()
            canClick = false
            let format = String(format: "%.1f", timeLeft)
            statusLabel.text = "Monkey is the winner with \(format) seconds to go!"
        }
    }
    
    func viewIntersectsView(_ first_View: UIView, second_View: UIView) -> Bool{
        return first_View.frame.intersects(second_View.frame)
    }
    
    @IBAction func restartGame(_ sender: Any) {
        apple1.isHidden = false
        apple2.isHidden = false
        apple3.isHidden = false
        apple4.isHidden = false
        
        canClick = true
        timer?.invalidate()
        countingDown = false
        timeLeft = 10.0
        
        monkey.frame.origin.x = 213
        monkey.frame.origin.y = 172
    }
}

