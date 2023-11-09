import Foundation

protocol ILoginViewModel {
    var service: ILoginService? { get set }
    func login(userName: String,
               password: String,
               completion: @escaping (Bool, Error?) -> Void)
}

class LoginViewModel: ILoginViewModel {
    
    var service: ILoginService?
    
    init(service: ILoginService? = nil) {
        self.service = service
    }
    
    func login(userName: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        guard userName.count > 0 && password.count > 0 else {
            completion(false, BDDError.emptyUserNameOrPassword)
            return
        }
        service?.login(userName: userName, 
                       password: password,
                       completion: { success, error in
            completion(success, error)
        })
    }
}
