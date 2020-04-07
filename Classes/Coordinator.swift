import UIKit

/// This is the main Coordinator class, it holds all the necessary functionality for the coordinators.
open class Coordinator {
	
	/// Navigation instance to be used by the coordinator
	public var navigation: UINavigationController
	
	/// Reference to the parent coordinator
	public weak var parent: Coordinator?
	
	/// Reference to the child coordinator
	public var child: Coordinator?
	
	/// Reference for the current view controller when starting a child navigation. This is where it will go back when the child finishes its navigation
	public var currentViewController: UIViewController?
	
	// MARK: - Initialization
	
	/// Creates a new instance of the Coordinator
	///
	/// - Parameter navigation: Navigation instance to be used by the coordinator
	public init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	// MARK: - Navigation
	
	/// Starting point of the navigation
	///
	/// - Parameter animated: Should or not animate the navigation
	open func start(animated: Bool) {}
	
	/// Go back in the navigation stack
	///
	/// - Parameters:
	///   - animated: Should or not animate the navigation
	///   - toRoot: Should or not go all the way back to the root view controller
	open func back(animated: Bool, toRoot: Bool) {
		if toRoot {
			navigation.popToRootViewController(animated: animated)
		} else {
			navigation.popViewController(animated: animated)
		}
	}
	
	/// Ends the navigation and tell the parent about it
	///
	/// - Parameter animated: Should or not animate the navigation
	open func finish(animated: Bool) {
		parent?.childFinished(animated: animated)
	}
	
	// MARK: - Child Navigation
	
	/// Starts the child's navigation
	///
	/// - Parameters:
	///   - child: Child that will take control over the navigation
	///   - animated: Should or not animate the navigation
	open func start(child: Coordinator, animated: Bool) {
		child.parent = self
		self.child = child
		currentViewController = navigation.topViewController
		child.start(animated: animated)
	}
	
	/// Default behaviour when a child finishes its navigation
	///
	/// - Parameter animated: Should or not animate the navigation
	open func childFinished(animated: Bool) {
		if let currentViewController = currentViewController {
			navigation.popToViewController(currentViewController, animated: animated)
		} else {
			navigation.popViewController(animated: animated)
		}
		child?.parent = nil
		child = nil
	}
}
