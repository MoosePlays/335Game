//
//  ViewController.swift
//  335Game
//
//  Created by Katie Simonson on 4/28/20.
//  Copyright © 2020 mjsimons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func up(_ sender: Any) {
        
    }
    
    @IBAction func down(_ sender: Any) {
        
    }
    
    @IBAction func right(_ sender: Any) {
        
    }
    
    @IBAction func left(_ sender: Any) {
        
    }
    
    func viewIntersectsView(_ first_View: UIView, second_View: UIView) -> Bool{
        return first_View.frame.intersects(second_View.frame)
    }
}

