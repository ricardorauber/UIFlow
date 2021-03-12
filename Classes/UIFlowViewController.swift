import UIKit
import Combine

open class UIFlowViewController: UIViewController {
    
    // MARK: - Properties
    
    private var cancellables: [Cancellable] = []
    
    // MARK: - Life Cycle
    
    deinit {
        removeObservers()
    }
    
    // MARK: - Observation
    
    public func observe<Type>(_ publisher: Published<Type>.Publisher, action: @escaping (Type) -> Void) {
        cancellables.append(publisher.sink { value in
            action(value)
        })
    }
    
    public func removeObservers() {
        for cancellable in cancellables {
            cancellable.cancel()
        }
        cancellables.removeAll()
    }
}
