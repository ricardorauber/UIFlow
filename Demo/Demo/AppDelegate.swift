import UIFlow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var coordinator: Coordinator?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		let navigation = UINavigationController()
		navigation.isNavigationBarHidden = true
		coordinator = AppCoordinator(navigation: navigation)
		coordinator?.start(animated: false)
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = navigation
		window?.makeKeyAndVisible()
		
		return true
	}
}
