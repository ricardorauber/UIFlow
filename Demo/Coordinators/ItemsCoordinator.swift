import UIFlow

class ItemsCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var navigation: UINavigationController
    weak var startViewController: UIViewController?
    weak var topViewController: UIViewController?
    var parent: Coordinator?
    var child: Coordinator?
    
    // MARK: - Initialization
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
	
	// MARK: - Coordinator
	
	func start(animated: Bool) {
		navigateToItemsList(animated: animated)
	}

    // MARK: - Items List
	
	func navigateToItemsList(animated: Bool) {
		guard let scene = ItemsListViewController.instantiate() else { return }
		scene.viewModel = ItemsListViewModel()
        scene.addNewItem = { [weak self] in
            self?.navigateToNewItem(animated: true)
        }
        scene.closeItemsList = { [weak self] in
            self?.finish(animated: true)
        }
        move(to: scene, animated: animated)
	}

    // MARK: - New Item
	
	func navigateToNewItem(animated: Bool) {
		guard let scene = NewItemViewController.instantiate() else { return }
		scene.viewModel = NewItemViewModel()
        scene.newItemCompleted = { [weak self] in
            self?.back(animated: true)
        }
        scene.newItemCanceled = { [weak self] in
            self?.back(animated: true)
        }
        move(to: scene, animated: animated)
	}
}
