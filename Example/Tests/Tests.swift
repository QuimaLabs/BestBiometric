import XCTest
import BestBiometric
import LocalAuthentication
@testable import BestBiometric

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDontAllow() {
        // This is an example of a functional test case.
        let permission = Biometric.getPermission()
        XCTAssertFalse(permission, "Dont Allow Permission")
    }
    
    func testAllow() {
        
        class StubLAContext: LAContext {
            override func evaluatePolicy(_ policy: LAPolicy, localizedReason: String, reply: @escaping (Bool, Error?) -> Void) { reply(true, nil) }
            override func canEvaluatePolicy(_ policy: LAPolicy, error: NSErrorPointer) -> Bool { return true }
        }
        
        let manager = Biometric()
        manager.authenticationContext = StubLAContext()
        manager.isValidAuthentication { (success) in
            XCTAssertTrue(success)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
