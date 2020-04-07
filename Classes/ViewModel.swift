/// Base view model object with all the functionality for data observation
open class ViewModel {
	
	/// All observers of the current view model
	var observers: [ViewModelObserver] = []
	
	/// Creates a new instance of the ViewModel
	public init() {}
	
	/// Notify all observers by executing their given listeners
	public func notifyObservers() {
		for observer in observers {
			observer.listener()
		}
	}
	
	/// Subscribe to ViewModel. Everytime the ViewModel runs the notifyObservers() method, all observers will be notified by executing the given listener
	///
	/// - Parameters:
	///   - source: Observer of the view model
	///   - listener: Listener to be executed when notified
	public func subscribe(_ source: AnyObject, listener: @escaping () -> Void) {
		if let index = observers.firstIndex(where: { observer -> Bool in observer.source === source }) {
			observers[index].listener = listener
		} else {
			observers.append(ViewModelObserver(source: source, listener: listener))
		}
	}
	
	/// Removes the observer from this view model
	///
	/// - Parameter source: Observer of the view model
	public func unsubscribe(_ source: AnyObject) {
		if let index = observers.firstIndex(where: { observer -> Bool in observer.source === source }) {
			observers.remove(at: index)
		}
	}
}
