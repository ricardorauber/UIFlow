import UIFlow

class OnboardingViewController: UIFlowViewController<ModelObservable, OnboardingViewNavigation> {
	
	@IBAction func finishedButtonTouchUpInside(_ sender: Any) {
		coordinator?.finishedOnboarding(self)
	}
}
