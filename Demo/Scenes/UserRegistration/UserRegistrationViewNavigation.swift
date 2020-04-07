protocol UserRegistrationViewNavigation {
	
	func navigateToUserRegistration(animated: Bool)
	
	func userRegistrationCompleted(_ sender: UserRegistrationViewController)
	
	func userRegistrationCancelled(_ sender: UserRegistrationViewController)
}
