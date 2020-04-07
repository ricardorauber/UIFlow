import UIFlow

class ItemsCoordinator: Coordinator {
	
	// MARK: - Coordinator
	
	override func start(animated: Bool) {
		navigateToItemsList(animated: animated)
	}
}

// MARK: - ItemsListViewNavigation
extension ItemsCoordinator: ItemsListViewNavigation {
	
	func navigateToItemsList(animated: Bool) {
		guard let scene = ItemsListViewController.instantiate() else { return }
		scene.coordinator = self
		scene.viewModel = ItemsListViewModel()
		navigation.pushViewController(scene, animated: animated)
	}
	
	func addNewItem(_ sender: ItemsListViewController) {
		navigateToNewItem(animated: true)
	}
	
	func closeItemsList(_ sender: ItemsListViewController) {
		finish(animated: true)
	}
}

// MARK: - NewItemViewNavigation
extension ItemsCoordinator: NewItemViewNavigation {
	
	func navigateToNewItem(animated: Bool) {
		guard let scene = NewItemViewController.instantiate() else { return }
		scene.coordinator = self
		scene.viewModel = NewItemViewModel()
		navigation.pushViewController(scene, animated: animated)
	}
	
	func newItemCompleted(_ sender: NewItemViewController) {
		back(animated: true, toRoot: false)
	}
	
	func newItemCanceled(_ sender: NewItemViewController) {
		back(animated: true, toRoot: false)
	}
}
