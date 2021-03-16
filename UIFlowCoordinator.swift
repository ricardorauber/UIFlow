import UIKit

open class UIFlowCoordinator: Coordinator {
    
    // MARK: - Properties

    public var navigation: UINavigationController
    public weak var startViewController: UIViewController?
    public weak var topViewController: UIViewController?
    public weak var parent: Coordinator?
    public var child: Coordinator?
    
    // MARK: - Initialization
    
    public init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    // MARK: - Coordinator Methods
    
    open func start(animated: Bool) {}
}
