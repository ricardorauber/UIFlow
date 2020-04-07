import Quick
import Nimble
@testable import UIFlow

class UIFlowViewControllerTests: QuickSpec {
	override func spec() {
		
		var viewController: TestViewController!
		var viewModel: TestViewModel!
		var coordinator: TestCoordinator!
		let timeout: TimeInterval = 1

		describe("UIFlowViewController") {

			beforeEach {
				let navigation = UINavigationController()
				viewModel = TestViewModel(name: "John", age: 35)
				coordinator = TestCoordinator(navigation: navigation)
				viewController = TestViewController.instantiate()
				viewController.viewModel = viewModel
				viewController.coordinator = coordinator
			}

			context("initialization") {

				it("should have the right view model") {
					expect(viewController?.viewModel).to(beIdenticalTo(viewModel))
				}

				it("should have the right coordinator") {
					expect(viewController?.coordinator).to(beIdenticalTo(coordinator))
				}
			}

			context("usage") {

				beforeEach {
					viewController?.viewDidLoad()
				}

				context("view model") {

					it("should update the UI after loading data") {
						viewController?.loadData()
						expect(viewController?.dataLoaded).toEventually(beTrue(), timeout: timeout)
					}
				}

				context("coordinator") {

					it("should change to a specific target") {
						viewController?.changeView(to: "dummy")
						expect(coordinator?.changedTo) == "dummy"
					}
				}
			}
		}
	}
}
