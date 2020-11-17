import UIFlow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var coordinator: Coordinator?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		let navigation = UINavigationController()
		navigation.isNavigationBarHidden = true
//		let coordinator = AppCoordinator(navigation: navigation)
        
        let coordinator = MenuCoordinator(navigation: navigation)
        coordinator.addItem(title: "Item 1",
                            image: nil,
                            selectedImage: nil,
                            coordinator: AppCoordinator())
        coordinator.addItem(title: "Item 2",
                            image: nil,
                            selectedImage: nil,
                            coordinator: AppCoordinator())
        for item in coordinator.items {
            item.navigation.isNavigationBarHidden = true
        }
        coordinator.start(animated: false)
        self.coordinator = coordinator
        
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = navigation
		window?.makeKeyAndVisible()
		
		return true
	}
}
