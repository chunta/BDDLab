import Foundation

protocol ILoginViewModelEventHandler {
    func loginDidComplete(_ error: Error?)
}

protocol ILoginViewModel {
    var service: ILoginService? { get set }
    var eventHandler: ILoginViewModelEventHandler? { get set }
    func login(_ userName: String, _ password: String)
}

class LoginViewModel: ILoginViewModel {
    
    var service: ILoginService?

    var eventHandler: ILoginViewModelEventHandler?
    
    init(service: ILoginService? = nil,
         eventHandler: ILoginViewModelEventHandler? = nil) {
        self.service = service
        self.eventHandler = eventHandler
    }
    
    func login(_ userName: String, _ password: String) {
        guard userName.count > 0 && password.count > 0 else {
            eventHandler?.loginDidComplete(BBDError.emptyUserNameOrPassword)
            return
        }
        service?.login(userName, password, completion: { success, error in
        })
    }
}
