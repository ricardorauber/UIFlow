import UIFlow

class AppCoordinator: Coordinator {
	
	// MARK: - Properties
    
    var navigation: UINavigationController
    weak var startViewController: UIViewController?
    weak var topViewController: UIViewController?
    var parent: Coordinator?
    var child: Coordinator?
	
	var firstTime = true
	var loggedIn = false
    
    // MARK: - Initialization
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
	
	// MARK: - Coordinator
	
	func start(animated: Bool) {
		if firstTime {
			navigateToOnboarding(animated: animated)
		} else if loggedIn {
			navigateToMenu(animated: animated)
		} else {
			navigateToLogin(animated: animated)
		}
	}

    // MARK: - Login
	
	func navigateToLogin(animated: Bool) {
		guard let scene = LoginViewController.instantiate() else { return }
        scene.goToUserRegistration = { [weak self] in
            self?.navigateToUserRegistration(animated: true)
        }
        scene.finishedLogin = { [weak self] in
            self?.loggedIn = true
            self?.start(animated: true)
        }
        move(to: scene, animated: animated)
	}

    // MARK: - Menu
	
	func navigateToMenu(animated: Bool) {
		guard let scene = MenuViewController.instantiate() else { return }
        scene.goToItems = { [weak self] in
            guard let self = self else { return }
            let itemsCoordinator = ItemsCoordinator(navigation: self.navigation)
            self.start(child: itemsCoordinator, animated: true)
        }
        scene.didLogout = { [weak self] in
            self?.loggedIn = false
            self?.backToStart(animated: true)
            self?.start(animated: false)
        }
        move(to: scene, animated: animated)
	}

    // MARK: - Onboarding
	
	func navigateToOnboarding(animated: Bool) {
		guard let scene = OnboardingViewController.instantiate() else { return }
        scene.finishedOnboarding = { [weak self] in
            self?.firstTime = false
            self?.start(animated: true)
        }
        move(to: scene, animated: animated)
	}

    // MARK: - Success
	
	func navigateToSuccess(animated: Bool) {
		guard let scene = SuccessViewController.instantiate() else { return }
        scene.successViewFinished = { [weak self] in
            self?.backToStart(animated: false)
            self?.navigateToLogin(animated: true)
        }
        move(to: scene, animated: animated)
	}

    // MARK: - UserRegistration
	
	func navigateToUserRegistration(animated: Bool) {
		guard let scene = UserRegistrationViewController.instantiate() else { return }
        scene.userRegistrationCompleted = { [weak self] in
            self?.navigateToSuccess(animated: true)
        }
        scene.userRegistrationCancelled = { [weak self] in
            self?.back(animated: true)
        }
        move(to: scene, animated: animated)
	}
}
