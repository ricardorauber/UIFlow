import UIFlow

class ItemsListViewModel {
	
    var items: [Item] {
        return Service.shared.items
    }
}
