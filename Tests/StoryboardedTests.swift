import Quick
import Nimble
@testable import UIFlow

class StoryboardedTests: QuickSpec {
	override func spec() {
		
		var viewController: UIViewController?
		
		describe("Storyboarded") {
			
			context("instantiate") {
				
				beforeEach {
					viewController = TestViewController.instantiate()
				}
				
				it("should not be nil") {
					expect(viewController).toNot(beNil())
				}
				
				it("should be the right source") {
					expect(viewController).to(beAnInstanceOf(TestViewController.self))
				}
			}
		}
	}
}
