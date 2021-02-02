
/*
 Get Permission - InfoPlist
 Save Data
 Read Data
 Delete Data
 
 note:
 Add on info.plist Privacy FaceID and touch id is write in code description
 */
public typealias ResultPermission = (Bool,Error?) -> Void

@objc
public class Biometric: NSObject {

    @objc public class func getPermission(resultPermission: @escaping ResultPermission) {
        
       let localAuth = LocalAuth()
        localAuth.getPermission(resultPermission: resultPermission)
    }
    @objc public class func saveValue(_ value: String, withID identifierKey:String) {
        
       let localAuth = LocalAuth()
       localAuth.saveData(value: value, identifierKey: identifierKey)
    }
    
    @objc public class func deleteValue(_ value: String, withID identifierKey:String) {
       let localAuth = LocalAuth()
       localAuth.deleteData(value: value, identifierKey: identifierKey)
    }
    
    @objc public class func readValue(_ value: String, withID identifierKey:String) {
       let localAuth = LocalAuth()
       localAuth.readData(identifierKey: identifierKey)
    }
    
}
