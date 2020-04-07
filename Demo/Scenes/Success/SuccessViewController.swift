import UIFlow

class SuccessViewController: UIFlowViewController<ViewModel, SuccessViewNavigation> {
	
	@IBAction func backButtonTouchUpInside(_ sender: Any) {
		coordinator?.successViewFinished(self)
	}
}
