import Foundation

protocol ILoginService {
    func login(_ userName: String, _ password: String, completion: @escaping (Bool, Error?) -> Void)
}

class LoginService: ILoginService {
    func login(_ userName: String, 
               _ password: String,
               completion: @escaping (Bool, Error?) -> Void) {
    }
}
