import UIFlow

class NewItemViewController: UIFlowViewController {
    
    var viewModel: NewItemViewModel!
	
	@IBOutlet weak var itemNameTextField: UITextField!
   
    var newItemCompleted: (() -> Void)?
    var newItemCanceled: (() -> Void)?
	
	override func viewDidLoad() {
        super.viewDidLoad()
        observe(viewModel.$state) { [weak self] value in
            guard let self = self else { return }
            if value == .itemAdded {
                self.itemNameTextField.text = nil
                self.showAlert(title: "Nice!", message: "Item added!")
            }
        }
	}
	
	func showAlert(title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
	}
	
	@IBAction func addItemButtonTouchUpInside(_ sender: Any) {
		guard let itemName = itemNameTextField.text, !itemName.isEmpty else { return }
		viewModel.addItem(name: itemName)
	}
	
	@IBAction func cancelButtonTouchUpInside(_ sender: Any) {
		if viewModel.state == .itemAdded {
			newItemCompleted?()
		} else {
			newItemCanceled?()
		}
	}
}
