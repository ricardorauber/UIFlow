import UIFlow

class AppCoordinator: Coordinator {
	
	// MARK: - Properties
	
	var firstTime = true
	var loggedIn = false
	
	// MARK: - Coordinator
	
	override func start(animated: Bool) {
		if firstTime {
			navigateToOnboarding(animated: animated)
		} else if loggedIn {
			navigateToMenu(animated: animated)
		} else {
			navigateToLogin(animated: animated)
		}
		if let currentViewController = navigation.viewControllers.last {
			navigation.setViewControllers([currentViewController], animated: false)
		}
	}
}

// MARK: - LoginViewNavigation
extension AppCoordinator: LoginViewNavigation {
	
	func navigateToLogin(animated: Bool) {
		guard let scene = LoginViewController.instantiate() else { return }
		scene.coordinator = self
		navigation.pushViewController(scene, animated: animated)
	}
	
	func goToUserRegistration(_ sender: LoginViewController) {
		navigateToUserRegistration(animated: true)
	}
	
	func finishedLogin(_ sender: LoginViewController) {
		loggedIn = true
		start(animated: true)
	}
}

// MARK: - MenuViewNavigation
extension AppCoordinator: MenuViewNavigation {
	
	func navigateToMenu(animated: Bool) {
		guard let scene = MenuViewController.instantiate() else { return }
		scene.coordinator = self
		navigation.pushViewController(scene, animated: animated)
	}
	
	func goToItems(_ sender: MenuViewController) {
		let itemsCoordinator = ItemsCoordinator(navigation: navigation)
		start(child: itemsCoordinator, animated: true)
	}
	
	func didLogout(_ sender: MenuViewController) {
		loggedIn = false
		start(animated: true)
	}
}

// MARK: - OnboardingViewNavigation
extension AppCoordinator: OnboardingViewNavigation {
	
	func navigateToOnboarding(animated: Bool) {
		guard let scene = OnboardingViewController.instantiate() else { return }
		scene.coordinator = self
		navigation.pushViewController(scene, animated: animated)
	}
	
	func finishedOnboarding(_ sender: OnboardingViewController) {
		firstTime = false
		start(animated: true)
	}
}

// MARK: - SuccessViewNavigation
extension AppCoordinator: SuccessViewNavigation {
	
	func navigateToSuccess(animated: Bool) {
		guard let scene = SuccessViewController.instantiate() else { return }
		scene.coordinator = self
		navigation.pushViewController(scene, animated: animated)
	}
	
	func successViewFinished(_ sender: SuccessViewController) {
		back(animated: true, toRoot: true)
	}
}

// MARK: - UserRegistrationViewNavigation
extension AppCoordinator: UserRegistrationViewNavigation {
	
	func navigateToUserRegistration(animated: Bool) {
		guard let scene = UserRegistrationViewController.instantiate() else { return }
		scene.coordinator = self
		navigation.pushViewController(scene, animated: animated)
	}
	
	func userRegistrationCompleted(_ sender: UserRegistrationViewController) {
		navigateToSuccess(animated: true)
	}
	
	func userRegistrationCancelled(_ sender: UserRegistrationViewController) {
		back(animated: true, toRoot: false)
	}
}
