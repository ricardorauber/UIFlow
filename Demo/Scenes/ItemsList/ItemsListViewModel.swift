import UIFlow

class ItemsListViewModel: ViewModel, ItemsListViewFeatures {
	
	var items: [Item] {
		return Service.shared.items
	}
}
