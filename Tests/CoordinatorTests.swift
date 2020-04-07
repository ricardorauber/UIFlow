import Quick
import Nimble
@testable import UIFlow

class CoordinatorTests: QuickSpec {
	override func spec() {
		
		var navigation: UINavigationController!
		var coordinator: TestCoordinator!
		
		describe("Coordinator") {
			
			beforeEach {
				navigation = UINavigationController()
				coordinator = TestCoordinator(navigation: navigation)
			}
			
			context("initialization") {
				
				it("should not have a parent coordinator") {
					expect(coordinator.parent).to(beNil())
				}
				
				it("should not have a child") {
					expect(coordinator.child).to(beNil())
				}
			}
			
			context("navigation") {
				
				beforeEach {
					coordinator.push(UIViewController())
					coordinator.push(UIViewController())
					coordinator.push(UIViewController())
				}
				
				it("should start with the start(animated:) method") {
					coordinator.start(animated: true)
					expect(coordinator.started).to(beTrue())
				}
				
				it("should go back one step if not set to go back to root") {
					coordinator.back(animated: false, toRoot: false)
					expect(navigation.children.count) == 2
				}
				
				it("should go back all the way if set to go back to root") {
					coordinator.back(animated: false, toRoot: true)
					expect(navigation.children.count) == 1
				}
			}
			
			context("child") {
				
				var child: TestCoordinator!
				
				beforeEach {
					child = TestCoordinator(navigation: navigation)
					coordinator.start(child: child, animated: false)
				}
				
				it("should set the parent when starting") {
					expect(child.parent).to(beIdenticalTo(coordinator))
					expect(coordinator.child).to(beIdenticalTo(child))
				}
				
				it("should be removed from the parent when finished") {
					child.finish(animated: false)
					expect(child.parent).to(beNil())
					expect(coordinator.child).to(beNil())
				}
				
				it("should go back one step if the parent hasn't a current view controller") {
					expect(child.parent).to(beIdenticalTo(coordinator))
					child.push(UIViewController())
					child.push(UIViewController())
					child.finish(animated: false)
					expect(navigation.children.count) == 1
				}
				
				it("should go back to the parent's current view controller") {
					child.finish(animated: false)
					let vc = UIViewController()
					coordinator.currentViewController = vc
					coordinator.push(vc)
					coordinator.start(child: child, animated: false)
					child.push(UIViewController())
					child.push(UIViewController())
					child.finish(animated: false)
					expect(navigation.topViewController).to(beIdenticalTo(vc))
				}
			}
		}
	}
}