import Foundation

protocol ILoginService {
    func login(userName: String,
               password: String,
               completion: @escaping (Bool, Error?) -> Void)
}

class LoginService: ILoginService {
    func login(userName: String,
               password: String,
               completion: @escaping (Bool, Error?) -> Void) {
    }
}
