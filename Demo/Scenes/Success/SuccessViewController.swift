import UIFlow

class SuccessViewController: UIFlowViewController<ModelObservable, SuccessViewNavigation> {
	
	@IBAction func backButtonTouchUpInside(_ sender: Any) {
		coordinator?.successViewFinished(self)
	}
}
