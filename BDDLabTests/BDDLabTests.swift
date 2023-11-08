@testable import BDDLab
import XCTest

final class BDDLabTestLoginViewModel: XCTestCase {
    
    private var loginService: BDDLabLoginServiceMock!
    private var loginViewModel: LoginViewModel!
    private let userName: String = "Gary"
    private let password: String = "68K^|&4$Bze0"
    
    override func setUp() {
        loginService = BDDLabLoginServiceMock()
        loginViewModel = LoginViewModel(service: loginService)
    }
    
    /// Make sure we return error when username or password is empty.
    func testViewModelWithEmptyInput() {
        loginViewModel.login(userName: "", password: "") { success, error in
            XCTAssertFalse(success)
        }
    }
    
    /// Make sure we return error when there is an issue in networking.
    func testViewModelWithNetworkingError() {
        loginService.error = BBDError.networkError(errorCode: 408, description: "Request timeout")
        loginViewModel.login(userName: userName, password: password) { success, error in
            XCTAssertFalse(success)
            XCTAssertNotNil(error)
        }
    }
    
    /// Make sure we succeed logining when input field are ready and there is no networking issue.
    func testViewModelWhenSuccessfullyLogin() {
        loginService.error = nil
        loginViewModel.login(userName: userName, password: password) { success, error in
            XCTAssertTrue(success)
            XCTAssertNil(error)
        }
    }
}
