import UIFlow

class ItemsListViewModel: ModelObservable, ItemsListViewFeatures {
	
	var observers: [ModelObserver] = []
	
	var items: [Item] {
		return Service.shared.items
	}
}
