import UIFlow

class TestCoordinator: Coordinator {
	
	var started = false
	var changedTo: String?
	
	// MARK: - Coordinator
	
	override func start(animated: Bool) {
		super.start(animated: animated)
		started = true
	}
	
	// MARK: - Test
	
	func change(to: String) {
		changedTo = to
	}
	
	func push(_ vc: UIViewController) {
		navigation.pushViewController(vc, animated: false)
	}
}
