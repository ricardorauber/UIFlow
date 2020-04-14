import UIFlow

class LoginViewController: UIFlowViewController<ModelObservable, LoginViewNavigation> {
	
	@IBAction func userRegistrationButtonTouchUpInside(_ sender: Any) {
		coordinator?.goToUserRegistration(self)
	}
	
	@IBAction func loginButtonTouchUpInside(_ sender: Any) {
		coordinator?.finishedLogin(self)
	}
}
