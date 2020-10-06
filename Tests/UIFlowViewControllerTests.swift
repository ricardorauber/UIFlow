import Quick
import Nimble
@testable import UIFlow

class UIFlowViewControllerTests: QuickSpec {
	override func spec() {
		
		var viewController: TestViewController!
		var viewModel: TestViewModel!
		let timeout: TimeInterval = 1

		describe("UIFlowViewController") {

			beforeEach {
				viewModel = TestViewModel(name: "John", age: 35)
				viewController = TestViewController.instantiate()
				viewController.viewModel = viewModel
			}

			context("initialization") {

				it("should have the right view model") {
					expect(viewController?.viewModel).to(beIdenticalTo(viewModel))
				}
			}

			context("usage") {

				beforeEach {
					viewController.viewDidLoad()
				}

				context("view model") {

					it("should update the UI after loading data") {
						viewController.loadData()
						expect(viewController.dataLoaded).toEventually(beTrue(), timeout: timeout)
					}
				}
			}
		}
	}
}
