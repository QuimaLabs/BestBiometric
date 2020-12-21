
/*
 Get Permission - InfoPlist
 Save Data
 Read Data
 Delete Data
 
 note:
 Add on info.plist Privacy FaceID and touch id is write in code description
 */
import LocalAuthentication

@objc
public class Biometric: NSObject {
    
    @objc public class func getPermission() -> Bool {
        let context = LAContext()
        //false only when is unavailable from setting or dont allow permission
        let canUseBiometric = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        guard canUseBiometric else {
            //go to settings
            
            return false
        }
        //get Permission
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: "Son necesarios los datos biométricos para validar que eres tu.",
                               reply: {result,error in
                                if(result){
                                    
                                }
        })
        return false
//        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
//                               localizedReason: "Son necesarios los datos biométricos para validar que eres tu.") { (success,
//                                                                evaluateError) in
    }
    
    func save(for userName: String, password: String, serviceName: String, accessGroup: String?) -> Bool {
        
        let passwordItem = KeychainPasswordItem(service: serviceName,
                                                account: userName,
                                                accessGroup: accessGroup)
        
        do {
            try passwordItem.savePassword(password)
            return true
        }catch{
            return false
        }
    }
}
