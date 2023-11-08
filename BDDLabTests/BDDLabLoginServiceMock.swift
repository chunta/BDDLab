@testable import BDDLab
import Foundation

class BDDLabLoginServiceMock: ILoginService {
    
    var error: Error?
    
    func login(userName: String,
               password: String,
               completion: @escaping (Bool, Error?) -> Void) {
        if let error = error {
            completion(false, error)
            return
        }
        completion(true, nil)
    }
}
