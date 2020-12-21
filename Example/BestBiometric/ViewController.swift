//
//  ViewController.swift
//  BestBiometric
//
//  Created by aquima on 12/19/2020.
//  Copyright (c) 2020 aquima. All rights reserved.
//

import UIKit
import BestBiometric

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let biometric = Biometric.getPermission()
        if biometric == false {
            //settings
            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: nil)
        }
        
        let result = save()
        print("Result save: \(result)")
//        biometric.getPer
    }

    //MARK: - Methods
    func save() -> Bool {
        let biometric = Biometric()
        return biometric.save(for: "aldaircc", password: "12345")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

