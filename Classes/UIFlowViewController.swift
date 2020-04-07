import UIKit

/// Base view controllet with the generic view model and coordinator to be subclassed for other scenes
open class UIFlowViewController<VM, C>: UIViewController, Storyboarded {
	
	// MARK: - Coordinator
	
	/// Coordinator of the scene
	public var coordinator: C?
	
	// MARK: - View Model
	
	/// View model of the scene
	public var viewModel: VM? {
		didSet {
			(oldValue as? ViewModel)?.unsubscribe(self)
			(viewModel as? ViewModel)?.subscribe(self) { [weak self] in
				DispatchQueue.main.async {
					self?.updateUI()
				}
			}
		}
	}
	
	deinit {
		(viewModel as? ViewModel)?.unsubscribe(self)
	}
	
	// MARK: - User Interface
	
	/// Main responder to the view model observation. It should be ovverriden in subclasses
	open func updateUI() {}

	// MARK: - Life cycle
	
	open override func viewDidLoad() {
		super.viewDidLoad()
		view.accessibilityIdentifier = String(describing: Self.self)
		updateUI()
	}
}
