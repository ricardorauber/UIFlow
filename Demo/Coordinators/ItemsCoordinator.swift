import UIFlow

class ItemsCoordinator: UIFlowCoordinator {
	
	// MARK: - Coordinator
	
	override func start(animated: Bool) {
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
