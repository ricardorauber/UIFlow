protocol LoginViewNavigation {
	
	func navigateToLogin(animated: Bool)
	
	func goToUserRegistration(_ sender: LoginViewController)
	
	func finishedLogin(_ sender: LoginViewController)
}
