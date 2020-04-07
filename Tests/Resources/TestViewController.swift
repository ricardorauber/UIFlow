import UIFlow

class TestViewController: UIFlowViewController<TestViewModel, TestCoordinator> {
	
	var dataLoaded: Bool = false
	
	@IBOutlet weak var label: UILabel!
	
	override func updateUI() {
		super.updateUI()
		if let loaded = viewModel?.loaded {
			dataLoaded = loaded
		}
	}
	
	func loadData() {
		viewModel?.load()
	}
	
	func changeView(to: String) {
		coordinator?.change(to: to)
	}
}
