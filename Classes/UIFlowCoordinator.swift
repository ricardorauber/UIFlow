import UIKit

open class UIFlowCoordinator: Coordinator {
    
    // MARK: - Navigation Properties
    
    public var navigation: UINavigationController
    
    // MARK: - View Controller Properties
    
    public weak var startViewController: UIViewController?
    public weak var topViewController: UIViewController?
    
    // MARK: - Coordinator Relationship Properties
    
    public weak var parent: Coordinator?
    public var child: Coordinator?
    
    // MARK: - Initialization
    
    public init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    // MARK: - Navigation Methods
    
    open func move(to destination: UIViewController, animated: Bool) {
        if startViewController == nil {
            startViewController = navigation.topViewController ?? destination
        }
        navigation.pushViewController(destination, animated: animated)
        topViewController = destination
    }
    
    // MARK: - Coordinator Methods
    
    open func start(animated: Bool) {}
    
    open func back(animated: Bool) {
        navigation.popViewController(animated: animated)
        topViewController = navigation.topViewController
    }
    
    open func backToTop(animated: Bool) {
        if let topViewController = topViewController {
            navigation.popToViewController(topViewController, animated: animated)
        }
    }
    
    open func backToStart(animated: Bool) {
        if let startViewController = startViewController {
            navigation.popToViewController(startViewController, animated: animated)
            topViewController = startViewController
        }
    }
    
    open func finish(animated: Bool) {
        parent?.childFinished(animated: animated)
    }
    
    // MARK: - Child Coordinator Methods
    
    open func start(child: Coordinator, animated: Bool) {
        child.parent = self
        self.child = child
        topViewController = navigation.topViewController
        child.start(animated: animated)
    }
    
    open func childFinished(animated: Bool) {
        child?.parent = nil
        child = nil
        backToTop(animated: animated)
    }
}
