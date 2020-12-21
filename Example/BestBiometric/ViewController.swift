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
//        let biometric = Biometric.getPermission()
//        if biometric == false {
//            //settings
//            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: nil)
//        }
        
        ///Test
        let bioInstance = Biometric()
        
        guard bioInstance.isAvailableBiometricsAuth() else {
            return
        }
        
        var username = "alda"
        let password = "369"
        let resultSave = bioInstance.save(for: username, password: password)
        print("Result save: \(resultSave)")

        let resultRead = bioInstance.read(for: username)
        print("Result read: \(resultRead)")
        
        
//        username = "as1231"
        let resultDelete = bioInstance.delete(for: username)
        
        print("Result delete: \(resultDelete)")
        
        let resultRead2 = bioInstance.read(for: username)
        print("Result read 2: \(resultRead2)")
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

