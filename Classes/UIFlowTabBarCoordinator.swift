import UIKit

open class UIFlowTabBarCoordinator: TabBarCoordinator {
    
    // MARK: - Coordinator Properties
    
    public var navigation: UINavigationController
    public weak var startViewController: UIViewController?
    public weak var topViewController: UIViewController?
    public weak var parent: Coordinator?
    public var child: Coordinator?
    
    // MARK: - TabBar Properties
    
    public var tabBar: UITabBarController
    
    // MARK: - Items Properties
    
    public var items: [Coordinator]
    public var currentItem: Coordinator {
        items[tabBar.selectedIndex]
    }
    
    // MARK: - Initialization
    
    public init(navigation: UINavigationController,
                tabBar: UITabBarController = UITabBarController(),
                items: [Coordinator] = []) {
        
        self.navigation = navigation
        self.tabBar = tabBar
        self.items = items
    }
    
    // MARK: - Navigation Methods
    
    open func start(animated: Bool) {
        move(to: tabBar, animated: animated)
    }
    
    // MARK: - Items Methods
    
    open func addItem(tabBarItem: UITabBarItem,
                      coordinator: Coordinator) {
        
        coordinator.parent = self
        coordinator.navigation.tabBarItem = tabBarItem
        items.append(coordinator)
        tabBar.viewControllers = items.map { $0.navigation }
        coordinator.start(animated: false)
    }
    
    open func addItem(title: String?,
                      image: UIImage?,
                      selectedImage: UIImage?,
                      coordinator: Coordinator) {
        
        let tabBarItem = UITabBarItem(title: title,
                                      image: image,
                                      selectedImage: selectedImage)
        addItem(tabBarItem: tabBarItem, coordinator: coordinator)
    }
    
    open func removeItem(at index: Int) {
        guard 0..<items.count ~= index else { return }
        items.remove(at: index)
        tabBar.viewControllers = items.map { $0.navigation }
    }
}
