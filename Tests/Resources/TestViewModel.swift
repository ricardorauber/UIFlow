import UIFlow

class TestViewModel: ModelObservable {
	
	var observers: [ModelObserver] = []
	
	private(set) var loaded: Bool
	private(set) var name: String
	private(set) var age: Int
	
	init(name: String, age: Int) {
		self.name = name
		self.age = age
		loaded = false
	}
	
	func update(name: String) {
		self.name = name
		notifyObservers()
	}
	
	func update(age: Int) {
		self.age = age
		notifyObservers()
	}
	
	func load() {
		name = "John"
		age = 34
		loaded = true
		notifyObservers()
	}
}
