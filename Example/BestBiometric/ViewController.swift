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
//        Biometric.saveValue("caramelo", withID: "BiometricID")
//        Biometric.readValue(withID: "BiometricID")
//        Biometric.deleteValue("caramelo", withID: "BiometricID")
        // Do any additional setup after loading the view, typically from a nib.

//        Biometric.getPermission( resultPermission: { success,error in
//            //biometricPermission = success
//            self.showResult(success: success, error: error)
//        })
        
            //settings
//            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: nil)
        
//        biometric.getPer
    }
    func showResult(success:Bool,
                    error:Error?){
        if error != nil {
            print(error.debugDescription)
        }else{
//            Biometric.saveValue("caramelo", withID: "BiometricID")
//            Biometric.saveValue("caramelo", withID: "BiometricID")
//            Biometric.deleteValue("caramelo", withID: "BiometricID")
           
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

