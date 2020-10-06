import UIFlow

class UserRegistrationViewController: UIFlowViewController {
    
    var userRegistrationCompleted: (() -> Void)?
    var userRegistrationCancelled: (() -> Void)?
	
	@IBAction func registerButtonTouchUpInside(_ sender: Any) {
		userRegistrationCompleted?()
	}
	
	@IBAction func cancelButtonTouchUpInside(_ sender: Any) {
		userRegistrationCancelled?()
	}
}
