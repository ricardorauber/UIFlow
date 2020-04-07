import UIFlow

class NewItemViewController: UIFlowViewController<NewItemViewFeatures, NewItemViewNavigation> {
	
	@IBOutlet weak var itemNameTextField: UITextField!
	
	override func updateUI() {
		guard let viewModel = viewModel else { return }
		if viewModel.state == .itemAdded {
			itemNameTextField.text = nil
			showAlert(title: "Nice!", message: "Item added!")
		}
	}
	
	func showAlert(title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
	}
	
	@IBAction func addItemButtonTouchUpInside(_ sender: Any) {
		guard let itemName = itemNameTextField.text, !itemName.isEmpty else { return }
		viewModel?.addItem(name: itemName)
	}
	
	@IBAction func cancelButtonTouchUpInside(_ sender: Any) {
		guard let viewModel = viewModel else {
			coordinator?.newItemCanceled(self)
			return
		}
		if viewModel.state == .itemAdded {
			coordinator?.newItemCompleted(self)
		} else {
			coordinator?.newItemCanceled(self)
		}
	}
}
