@testable import BDDLab
import Foundation

class BDDLabLoginViewModelMock: ILoginViewModel {
    var service: ILoginService?
    
    var success: Bool = false
    
    init(service: ILoginService) {
        self.service = service
    }
    
    func login(userName: String,
               password: String,
               completion: @escaping (Bool, Error?) -> Void) {
        guard userName.count > 0 && password.count > 0 else {
            success = false
            completion(false, BDDError.emptyUserNameOrPassword)
            return
        }
        guard let service = service else {
            success = false
            completion(false, BDDError.unknown(description: "No service provided"))
            return
        }
        service.login(userName: userName, password: password) { success, error in
            guard error == nil else {
                self.success = false
                completion(false, error)
                return
            }
            self.success = true
            completion(true, nil)
        }
    }
}
