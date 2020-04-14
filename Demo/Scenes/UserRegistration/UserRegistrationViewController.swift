import UIFlow

class UserRegistrationViewController: UIFlowViewController<ModelObservable, UserRegistrationViewNavigation> {
	
	@IBAction func registerButtonTouchUpInside(_ sender: Any) {
		coordinator?.userRegistrationCompleted(self)
	}
	
	@IBAction func cancelButtonTouchUpInside(_ sender: Any) {
		coordinator?.userRegistrationCancelled(self)
	}
}
