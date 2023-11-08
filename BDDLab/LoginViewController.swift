import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private var userInput: UITextField!
        
    @IBOutlet private var passwordInput: UITextField!
    
    @IBOutlet private var loginButton: UIButton!
    
    private var loginViewModel: ILoginViewModel
    
    init(viewModel: ILoginViewModel) {
        self.loginViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        loginViewModel.login(userName: userInput.text ?? "",
                             password: passwordInput.text ?? "") { success, error in
        }
    }
}
