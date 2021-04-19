import Quick
import Nimble
@testable import UIFlow

class UIFlowTabBarCoordinatorTests: QuickSpec {
    override func spec() {
        
        var navigation: UINavigationController!
        var coordinator: TestTabBarCoordinator!
        
        describe("TabBarCoordinator") {
            
            beforeEach {
                navigation = UINavigationController()
                coordinator = TestTabBarCoordinator(navigation: navigation)
            }
            
            context("initialization") {
                
                it("should not have items") {
                    expect(coordinator.items.count) == 0
                }
            }
            
            context("navigation") {
                
                it("when starting, it should move to the tabBar") {
                    coordinator.start(animated: false)
                    expect(coordinator.startViewController) == coordinator.tabBar
                }
            }
            
            context("items") {
                
                it("should add an UITabBarItem") {
                    let tabBarItem = UITabBarItem(title: "title",
                                                  image: nil,
                                                  selectedImage: nil)
                    coordinator.addItem(tabBarItem: tabBarItem,
                                        coordinator: TestCoordinator(navigation: UINavigationController()))
                    expect(coordinator.items.count) == 1
                }
                
                it("should add an item using the parameters") {
                    coordinator.addItem(title: "title",
                                        image: nil,
                                        selectedImage: nil,
                                        coordinator: TestCoordinator(navigation: UINavigationController()))
                    expect(coordinator.items.count) == 1
                }
                
                it("should get the current item") {
                    let itemCoordinator = TestCoordinator(navigation: UINavigationController())
                    coordinator.addItem(title: "title",
                                        image: nil,
                                        selectedImage: nil,
                                        coordinator: itemCoordinator)
                    expect(coordinator.currentItem) === itemCoordinator
                }
                
                it("should remove items") {
                    coordinator.addItem(title: "title",
                                        image: nil,
                                        selectedImage: nil,
                                        coordinator: TestCoordinator(navigation: UINavigationController()))
                    coordinator.addItem(title: "title",
                                        image: nil,
                                        selectedImage: nil,
                                        coordinator: TestCoordinator(navigation: UINavigationController()))
                    expect(coordinator.items.count) == 2
                    coordinator.removeItem(at: 0)
                    expect(coordinator.items.count) == 1
                }
                
                it("should not remove an invalid index") {
                    coordinator.addItem(title: "title",
                                        image: nil,
                                        selectedImage: nil,
                                        coordinator: TestCoordinator(navigation: UINavigationController()))
                    expect(coordinator.items.count) == 1
                    coordinator.removeItem(at: 10)
                    expect(coordinator.items.count) == 1
                }
            }
        }
    }
}

fileprivate class TestCoordinator: UIFlowCoordinator {

	var started = false
	var changedTo: String?
	
	// MARK: - Coordinator
	
	override func start(animated: Bool) {
		started = true
	}
	
	// MARK: - Test
	
	func change(to: String) {
		changedTo = to
	}
	
	func push(_ vc: UIViewController) {
		navigation.pushViewController(vc, animated: false)
        if let testVc = vc as? TestViewController {
            testVc.changeView = { [weak self] view in
                self?.change(to: view)
            }
        }
	}
}

fileprivate class TestTabBarCoordinator: UIFlowTabBarCoordinator {}
