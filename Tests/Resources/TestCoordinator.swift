import UIFlow

class TestCoordinator: Coordinator {
    
    var navigation: UINavigationController
    weak var startViewController: UIViewController?
    weak var topViewController: UIViewController?
    var parent: Coordinator?
    var child: Coordinator?

	var started = false
	var changedTo: String?
    
    // MARK: - Initialization
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
	
	// MARK: - Coordinator
	
	func start(animated: Bool) {
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
