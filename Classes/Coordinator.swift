import UIKit

public protocol Coordinator: AnyObject {
    
    // MARK: - Navigation Properties
    
    var navigation: UINavigationController { get }
    
    // MARK: - View Controller Properties
    
    var startViewController: UIViewController? { get set }
    var topViewController: UIViewController? { get set }
    
    // MARK: - Coordinator Relationship Properties
    
    var parent: Coordinator? { get set }
    var child: Coordinator? { get set }
    
    // MARK: - Navigation Methods
    
    func move(to destination: UIViewController, animated: Bool)
    
    // MARK: - Coordinator Methods
    
    func start(animated: Bool)
    func back(animated: Bool)
    func backToTop(animated: Bool)
    func backToStart(animated: Bool)
    func finish(animated: Bool)
    
    // MARK: - Child Coordinator Methods
    
    func start(child: Coordinator, animated: Bool)
    func childFinished(animated: Bool)
}

extension Coordinator {
    
    // MARK: - Navigation Methods
    
    public func move(to destination: UIViewController, animated: Bool) {
        if startViewController == nil {
            startViewController = destination
        }
        navigation.pushViewController(destination, animated: animated)
        topViewController = destination
    }
    
    // MARK: - Coordinator Methods
    
    public func back(animated: Bool) {
        navigation.popViewController(animated: animated)
        topViewController = navigation.topViewController
    }
    
    public func backToTop(animated: Bool) {
        if let topViewController = topViewController {
            navigation.popToViewController(topViewController, animated: animated)
        }
    }
    
    public func backToStart(animated: Bool) {
        if let startViewController = startViewController {
            navigation.popToViewController(startViewController, animated: animated)
            topViewController = startViewController
        }
    }
    
    public func finish(animated: Bool) {
        parent?.childFinished(animated: animated)
    }
    
    // MARK: - Child Coordinator Methods
    
    public func start(child: Coordinator, animated: Bool) {
        child.parent = self
        self.child = child
        topViewController = navigation.topViewController
        child.start(animated: animated)
    }
    
    public func childFinished(animated: Bool) {
        child?.parent = nil
        child = nil
        backToTop(animated: animated)
    }
}
