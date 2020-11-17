import UIKit

public protocol TabBarCoordinator: Coordinator {
    
    // MARK: - TabBar Properties
    
    var tabBar: UITabBarController { get }
    
    // MARK: - Items Properties
    
    var currentItem: Coordinator { get }
    var items: [Coordinator] { get set }
    
    // MARK: - Items Methods
    
    func addItem(tabBarItem: UITabBarItem,
                 coordinator: Coordinator)
    
    func addItem(title: String?,
                 image: UIImage?,
                 selectedImage: UIImage?,
                 coordinator: Coordinator)
    
    func removeItem(at index: Int)
}

extension TabBarCoordinator {
    
    // MARK: - Items Properties
    
    public var currentItem: Coordinator {
        items[tabBar.selectedIndex]
    }
    
    // MARK: - Navigation Methods
    
    public func start(animated: Bool) {
        move(to: tabBar, animated: animated)
    }
    
    // MARK: - Items Methods
    
    public func addItem(tabBarItem: UITabBarItem,
                        coordinator: Coordinator) {
        
        coordinator.parent = self
        coordinator.navigation.tabBarItem = tabBarItem
        items.append(coordinator)
        tabBar.viewControllers = items.map { $0.navigation }
        coordinator.start(animated: false)
    }
    
    public func addItem(title: String?,
                        image: UIImage?,
                        selectedImage: UIImage?,
                        coordinator: Coordinator) {
        
        let tabBarItem = UITabBarItem(title: title,
                                      image: image,
                                      selectedImage: selectedImage)
        addItem(tabBarItem: tabBarItem, coordinator: coordinator)
    }
    
    public func removeItem(at index: Int) {
        guard 0..<items.count ~= index else { return }
        items.remove(at: index)
        tabBar.viewControllers = items.map { $0.navigation }
    }
}
