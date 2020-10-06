import UIFlow

class OnboardingViewController: UIFlowViewController {
	
    var finishedOnboarding: (() -> Void)?
    
	@IBAction func finishedButtonTouchUpInside(_ sender: Any) {
		finishedOnboarding?()
	}
}
