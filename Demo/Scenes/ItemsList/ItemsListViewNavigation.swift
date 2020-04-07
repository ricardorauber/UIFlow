protocol ItemsListViewNavigation {
	
	func navigateToItemsList(animated: Bool)
	
	func addNewItem(_ sender: ItemsListViewController)
	
	func closeItemsList(_ sender: ItemsListViewController)
}
