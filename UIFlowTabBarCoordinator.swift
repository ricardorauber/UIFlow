import UIKit

open class UIFlowTabBarCoordinator: TabBarCoordinator {
    
    // MARK: - Coordinator Properties
    
    public var navigation: UINavigationController
    public weak var startViewController: UIViewController?
    public weak var topViewController: UIViewController?
    public weak var parent: Coordinator?
    public var child: Coordinator?
    
    // MARK: - TabBarCoordinator Properties
    
    public var tabBar: UITabBarController
    public var items: [Coordinator]
    
    // MARK: - Initialization
    
    public init(navigation: UINavigationController,
                tabBar: UITabBarController = UITabBarController(),
                items: [Coordinator] = []) {
        
        self.navigation = navigation
        self.tabBar = tabBar
        self.items = items
    }
}
