
/*
 Get Permission - InfoPlist
 Save Data
 Read Data
 Delete Data
 
 note:
 Add on info.plist Privacy FaceID and touch id is write in code description
 */
import LocalAuthentication

//KeyChain Configuration
struct KeychainConfiguration {
  static let serviceName = "biometricLibrary"
  static let accessGroup: String? = nil
}

@objc
public class Biometric: NSObject {
    
    //MARK: - Variables
    ///internal variable for XCTestCase
    internal var authenticationContext = LAContext()
    
    
    //MARK: - Methods
    func isAvailableBiometricsAuth() -> Bool {
        return authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }
    
    func isValidAuthentication(completion: @escaping (_ success: Bool) -> Void) {
        guard isAvailableBiometricsAuth() else {
            completion(false)
            return
        }
        
        authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                             localizedReason: "We need you information for validate you are the correct person?") { (success, error) in
            completion(success)
        }
    }
    
    
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
    
    public func save(for userName: String, password: String) -> Bool {
        
//        let passwordItem = KeychainPasswordItem(service: serviceName,
//                                                account: userName,
//                                                accessGroup: accessGroup)
//
//        do {
//            try passwordItem.savePassword(password)
//            return true
//        }catch{
//            return false
//        }
        
        
        do {
          let passworItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                 account: userName,
                                                 accessGroup: KeychainConfiguration.accessGroup)
            
            let arrayPass = try KeychainPasswordItem.passwordItems(forService: KeychainConfiguration.serviceName)
            
            print(arrayPass)
            
            try passworItem.savePassword(password)
        } catch {
          fatalError("Error updateing keychan - \(error)")
            return false
        }
        return true
    }
}
