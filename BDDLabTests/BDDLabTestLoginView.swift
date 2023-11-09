@testable import BDDLab

import Quick
import Nimble

class BDDLabTestLoginView: QuickSpec {
    
    private var sutLoginViewController: LoginViewController!
    
    private var loginViewModel: BDDLabLoginViewModelMock!
    
    private var loginService: BDDLabLoginServiceMock!
    
    override func spec() {
        describe("Basic test for integer and string") {
            beforeEach {
                self.loginService = BDDLabLoginServiceMock()
                self.loginViewModel = BDDLabLoginViewModelMock(service: self.loginService)
                self.sutLoginViewController = LoginViewController(viewModel: self.loginViewModel)
                self.sutLoginViewController.loadViewIfNeeded()
            }
            context("Make sure all UIs are loaded") {
                it("user input textfield is not nil") {
                    expect(self.sutUserInput()).notTo(beNil())
                }
                
                it("password input textfield is not nil") {
                    expect(self.sutPasswordInput()).notTo(beNil())
                }
                
                it("login button is not nil") {
                    expect(self.sutLoginButton()).notTo(beNil())
                }
            }
            beforeEach {
                self.sutUserInput().text = "userName"
                self.sutPasswordInput().text = "password"
                self.sutLoginButton().sendActions(for: .touchUpInside)
            }
            context("Check viewModel's state after UI action") {
                it("login state in loginViewModel should be successful") {
                    expect(self.loginViewModel.success).to(equal(true))
                }
            }
        }
    }
}

extension BDDLabTestLoginView {
    private func sutUserInput() -> UITextField {
        sutLoginViewController.value(forKey: "userInput") as! UITextField
    }
    
    private func sutPasswordInput() -> UITextField {
        sutLoginViewController.value(forKey: "passwordInput") as! UITextField
    }
    
    private func sutLoginButton() -> UIButton {
        sutLoginViewController.value(forKey: "loginButton") as! UIButton
    }
}
