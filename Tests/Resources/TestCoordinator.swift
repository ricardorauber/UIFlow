import UIFlow

class TestCoordinator: UIFlowCoordinator {

	var started = false
	var changedTo: String?
	
	// MARK: - Coordinator
	
	override func start(animated: Bool) {
		started = true
	}
	
	// MARK: - Test
	
	func change(to: String) {
		changedTo = to
	}
	
	func push(_ vc: UIViewController) {
		navigation.pushViewController(vc, animated: false)
        if let testVc = vc as? TestViewController {
            testVc.changeView = { [weak self] view in
                self?.change(to: view)
            }
        }
	}
}
