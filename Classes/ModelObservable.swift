/// Protocol with all the functionality needed for model observation
public protocol ModelObservable: AnyObject {
	
	/// All observers of the current model
	var observers: [ModelObserver] { get set }
	
	/// Notify all observers by executing their given listeners
	func notifyObservers()
	
	/// Subscribe to the model notifications. Everytime the instance runs the notifyObservers() method, all observers will be notified by executing the given listener
	/// - Parameters:
	///   - source: Observer of the model
	///   - listener: Listener to be executed when notified
	func subscribe(_ source: AnyObject, listener: @escaping () -> Void)
	
	/// Removes the observer from this model
	/// - Parameter source: Observer of the model
	func unsubscribe(_ source: AnyObject)
}

// MARK: - Default implementation
extension ModelObservable {
	
	public func notifyObservers() {
		for observer in observers {
			observer.listener()
		}
	}
	
	public func subscribe(_ source: AnyObject, listener: @escaping () -> Void) {
		if let index = observers.firstIndex(where: { observer -> Bool in observer.source === source }) {
			observers[index].listener = listener
		} else {
			observers.append(ModelObserver(source: source, listener: listener))
		}
	}

	public func unsubscribe(_ source: AnyObject) {
		if let index = observers.firstIndex(where: { observer -> Bool in observer.source === source }) {
			observers.remove(at: index)
		}
	}
}
