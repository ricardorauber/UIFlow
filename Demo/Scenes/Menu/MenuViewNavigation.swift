protocol MenuViewNavigation {
	
	func navigateToMenu(animated: Bool)
	
	func goToItems(_ sender: MenuViewController)
	
	func didLogout(_ sender: MenuViewController)
}
