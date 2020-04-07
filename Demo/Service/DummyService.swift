class Service {
	
	static let shared = Service()
	
	var items: [Item] = [
		Item(name: "Pen"),
		Item(name: "Pencil"),
		Item(name: "Eraser")
	]
}
