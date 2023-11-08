import UIKit
import FPSLabel

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let navigationController = self.window?.rootViewController as? UINavigationController {
            let loginService = LoginService()
            let viewModel = LoginViewModel(service: loginService)
            let loginViewController = LoginViewController(viewModel: viewModel)
            navigationController.setViewControllers([loginViewController], animated: false)
        }
        
        FPSLabel.install(on: self.window)
        
        return true
    }
}
