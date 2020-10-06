import UIFlow
import Combine

class NewItemViewModel {
	
	@Published var state: NewItemViewState = .started
	
	func addItem(name: String) {
		Service.shared.items.append(Item(name: name))
		state = .itemAdded
	}
}
