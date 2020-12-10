//
//  ViewController.swift
//  Torch and traffic light
//
//  Created by Денис Бирюков on 10.12.2020.
//

import UIKit

class ViewController: UIViewController {

    var lightOn = 0
    
//    view.backgroundColor = .grey
    
    fileprivate func updareUI() {
        switch lightOn {
        case 0:
            view.backgroundColor = .white
        case 1:
            view.backgroundColor = .yellow
        case 2:
            view.backgroundColor = .green
        case 3:
            view.backgroundColor = .cyan
        default:
            view.backgroundColor = .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updareUI()
    }

    @IBAction func buttonPresed(_ sender: UIButton) {
        lightOn = lightOn < 3 ? lightOn + 1 : -1
        updareUI()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
    }
}

