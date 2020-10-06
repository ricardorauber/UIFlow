import Combine

class TestViewModel {
	
	@Published var loaded: Bool
    @Published var name: String
    @Published var age: Int
	
	init(name: String, age: Int) {
		self.name = name
		self.age = age
		loaded = false
	}
	
	func update(name: String) {
		self.name = name
	}
	
	func update(age: Int) {
		self.age = age
	}
	
	func load() {
		name = "John"
		age = 34
		loaded = true
	}
}
