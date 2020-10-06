import UIFlow

class TestViewController: UIFlowViewController {
	
    // MARK: - Dependencies
    
    var viewModel: TestViewModel!
    
    // MARK: - Properties
    
	var dataLoaded: Bool = false
    
    // MARK: - Outlets
	
	@IBOutlet weak var label: UILabel!
    
    // MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
        observe(viewModel.$loaded) { [weak self] value in
            self?.dataLoaded = value
        }
        loadData()
	}
    
    // MARK: - Data
	
	func loadData() {
		viewModel.load()
	}
    
    // MARK: - Actions
    
    var changeView: ((String) -> Void)?
}
