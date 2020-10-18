//
//  ViewController.swift
//  Light
//
//  Created by Максим Иванов on 18.10.2020.
//

import UIKit

class ViewController: UIViewController {

    var isLightOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }


    fileprivate func updateView() {
        view.backgroundColor = isLightOn ? .white : .black
    }
    
    @IBAction func buttonPressed() {
        isLightOn.toggle()
        updateView()
    }
}

