import UIFlow

class SuccessViewController: UIFlowViewController {
	
    var successViewFinished: (() -> Void)?
    
	@IBAction func backButtonTouchUpInside(_ sender: Any) {
		successViewFinished?()
	}
}
