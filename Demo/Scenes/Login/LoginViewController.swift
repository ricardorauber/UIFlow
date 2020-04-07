import UIFlow

class LoginViewController: UIFlowViewController<ViewModel, LoginViewNavigation> {
	
	@IBAction func userRegistrationButtonTouchUpInside(_ sender: Any) {
		coordinator?.goToUserRegistration(self)
	}
	
	@IBAction func loginButtonTouchUpInside(_ sender: Any) {
		coordinator?.finishedLogin(self)
	}
}
