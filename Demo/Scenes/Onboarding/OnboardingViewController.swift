import UIFlow

class OnboardingViewController: UIFlowViewController<ViewModel, OnboardingViewNavigation> {
	
	@IBAction func finishedButtonTouchUpInside(_ sender: Any) {
		coordinator?.finishedOnboarding(self)
	}
}
