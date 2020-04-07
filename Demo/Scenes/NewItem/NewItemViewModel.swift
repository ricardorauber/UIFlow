import UIFlow

class NewItemViewModel: ViewModel {
	
	private(set) var state: NewItemViewState = .started
}

extension NewItemViewModel: NewItemViewFeatures {
	
	func addItem(name: String) {
		Service.shared.items.append(Item(name: name))
		state = .itemAdded
		notifyObservers()
	}
}
