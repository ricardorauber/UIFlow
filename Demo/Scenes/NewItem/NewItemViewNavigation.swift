protocol NewItemViewNavigation {
	
	func navigateToNewItem(animated: Bool)
	
	func newItemCompleted(_ sender: NewItemViewController)
	
	func newItemCanceled(_ sender: NewItemViewController)
}
