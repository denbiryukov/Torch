//
//  ViewController.swift
//  Torch and traffic light
//
//  Created by Денис Бирюков on 10.12.2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var lightOn = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
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
        
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
            guard device.hasTorch else { return }

            do {
                try device.lockForConfiguration()

                if (device.torchMode == AVCaptureDevice.TorchMode.on) {
                    device.torchMode = AVCaptureDevice.TorchMode.off
                } else {
                    do {
                        try device.setTorchModeOn(level: 1.0)
                    } catch {
                        print(error)
                    }
                }

                device.unlockForConfiguration()
            } catch {
                print(error)
            }
    }
}

