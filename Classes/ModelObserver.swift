/// Internal structure to manage model observers
public struct ModelObserver {

	/// Observer of the model
	public let source: AnyObject
	
	/// Listener to be executed when notified
	public var listener: () -> Void
	
	/// Creates a new instance of the ModelObserver
	///
	/// - Parameters:
	///   - source: Observer of the model
	///   - listener: Listener to be executed when notified
	public init(source: AnyObject, listener: @escaping () -> Void) {
		self.source = source
		self.listener = listener
	}
}
