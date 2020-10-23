//
//  ViewController.swift
//  Light
//
//  Created by Максим Иванов on 18.10.2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var isLightOn: Bool = true
    
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }


    fileprivate func updateView() {
        view.backgroundColor = isLightOn ? .white : .black
        
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
    
    @IBAction func buttonPressed() {
        isLightOn.toggle()
        updateView()
    }
}

