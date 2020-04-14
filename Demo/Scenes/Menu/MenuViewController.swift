import UIFlow

class MenuViewController: UIFlowViewController<ModelObservable, MenuViewNavigation> {
	
	@IBAction func itemsButtonTouchUpInside(_ sender: Any) {
		coordinator?.goToItems(self)
	}
	
	@IBAction func logoutButtonTouchUpInside(_ sender: Any) {
		coordinator?.didLogout(self)
	}
}
