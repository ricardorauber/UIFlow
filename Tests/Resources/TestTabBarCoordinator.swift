import UIFlow

class TestTabBarCoordinator: TabBarCoordinator {
    
    // MARK: - Coordinator Properties
    
    var navigation: UINavigationController
    weak var startViewController: UIViewController?
    weak var topViewController: UIViewController?
    var parent: Coordinator?
    var child: Coordinator?
    
    // MARK: - TabBarCoordinator Properties
    
    let tabBar: UITabBarController
    var items: [Coordinator]
    
    // MARK: - Initialization
    
    init(navigation: UINavigationController,
         tabBar: UITabBarController = UITabBarController()) {
        
        self.navigation = navigation
        self.tabBar = tabBar
        items = []
    }
}
