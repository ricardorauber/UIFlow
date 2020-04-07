import UIKit

/// Protocol to instantiate view controllers from a storyboards
public protocol Storyboarded: AnyObject {
	
	/// Instantiate a view controller from a storyboard with the same name
	static func instantiate() -> Self?
}

// MARK: - UIViewController
public extension Storyboarded where Self: UIViewController {
	
	static func instantiate() -> Self? {
		let bundle = Bundle(for: Self.self)
		let name = String(describing: Self.self)
		let storyboard = UIStoryboard(name: name, bundle: bundle)
		return storyboard.instantiateInitialViewController() as? Self
	}
}
