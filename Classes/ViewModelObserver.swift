/// Internal structure to manage ViewModel observers
struct ViewModelObserver {

	/// Observer of the view model
	let source: AnyObject
	
	/// Listener to be executed when notified
	var listener: () -> Void
}
