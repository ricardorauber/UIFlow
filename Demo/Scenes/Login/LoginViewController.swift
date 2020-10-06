import UIFlow

class LoginViewController: UIFlowViewController {
    
    var goToUserRegistration: (() -> Void)?
    var finishedLogin: (() -> Void)?
	
	@IBAction func userRegistrationButtonTouchUpInside(_ sender: Any) {
		goToUserRegistration?()
	}
	
	@IBAction func loginButtonTouchUpInside(_ sender: Any) {
		finishedLogin?()
	}
}
