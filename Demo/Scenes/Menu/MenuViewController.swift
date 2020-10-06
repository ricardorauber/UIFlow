import UIFlow

class MenuViewController: UIFlowViewController {
    
    var goToItems: (() -> Void)?
    var didLogout: (() -> Void)?
	
	@IBAction func itemsButtonTouchUpInside(_ sender: Any) {
		goToItems?()
	}
	
	@IBAction func logoutButtonTouchUpInside(_ sender: Any) {
		didLogout?()
	}
}
