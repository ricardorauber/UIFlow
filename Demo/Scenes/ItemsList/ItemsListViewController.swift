import UIFlow

class ItemsListViewController: UIFlowViewController {
    
    var viewModel: ItemsListViewModel!
	
	@IBOutlet weak var itemsTableView: UITableView!
    
    var addNewItem: (() -> Void)?
    var closeItemsList: (() -> Void)?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		itemsTableView.reloadData()
	}
	
	@IBAction func addItemButtonTouchUpInside(_ sender: Any) {
		addNewItem?()
	}
	
	@IBAction func backButtonTouchUpInside(_ sender: Any) {
		closeItemsList?()
	}
}

// MARK: - UITableViewDataSource
extension ItemsListViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let item = viewModel?.items[indexPath.row]
		cell.textLabel?.text = item?.name ?? "-"
		return cell
	}
}

// MARK: - UITableViewDelegate
extension ItemsListViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
