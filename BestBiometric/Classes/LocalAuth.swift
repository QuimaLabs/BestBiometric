//
//  LocalAuth.swift
//  BestBiometric
//
//  Created by Raul Samuel Quispe Mamani on 12/21/20.
//

import UIKit
import LocalAuthentication
class LocalAuth: NSObject {
    
    let context = LAContext()
    //CanAuthenticate - primera vez
    //true - error -
    //enroll una sola vez
    func getPermission(resultPermission: @escaping ResultPermission) {
        
        //false only when is unavailable from setting or dont allow permission
        var authorizationError:NSError?
        let canUseBiometric = context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthentication,
                                                        error: &authorizationError)
        guard canUseBiometric else {
            //go to settings
            resultPermission(false,nil)
            return
        }
        //get Permission
        context
            .evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                            localizedReason: "Son necesarios los datos biométricos para validar que eres tu.",
                            reply: {result,error in
                                if(result){
                                    resultPermission(true,nil)
                                }else{
                                    resultPermission(false,error)
                                }
                            })
    }
    func saveData(value:String, identifierKey:String){
        do {
            let passwordItem = KeychainPasswordItem(service: identifierKey,
                                                    account: "pacific_user_one",
                                                    accessGroup: KeychainConfiguration.accessGroup)
            try passwordItem.savePassword(value)
            print("Success")
        }catch{
            print("error")
        }
    }
    func deleteData(value:String, identifierKey:String){
        do {
            let passwordItem = KeychainPasswordItem(service: identifierKey,
                                                    account: "pacific_user_one",
                                                    accessGroup: KeychainConfiguration.accessGroup)
            try passwordItem.deleteItem()
            print("Success")
        }catch{
                print("error")
        }
    }
    func readData(identifierKey:String){
        do {
            let passwordItem = KeychainPasswordItem(service: identifierKey,
                                                    account: "pacific_user_one",
                                                    accessGroup: KeychainConfiguration.accessGroup)
            let keychainValue = try passwordItem.readPassword()
            print("Success \(keychainValue)")
        }catch{
            print("error")
        }
    }
}
