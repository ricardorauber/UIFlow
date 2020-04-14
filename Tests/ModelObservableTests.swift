import Quick
import Nimble
@testable import UIFlow

class ModelObservableTests: QuickSpec {
	override func spec() {
		
		var viewModel: TestViewModel!

		describe("ModelObservable") {

			context("initialization") {

				beforeEach {
					viewModel = TestViewModel(name: "John", age: 34)
				}

				it("should not be nil") {
					expect(viewModel).toNot(beNil())
				}

				it("should have the right properties") {
					expect(viewModel.name) == "John"
					expect(viewModel.age) == 34
				}
			}

			context("usage") {

				var view: View!
				var secondaryView: View!

				beforeEach {
					viewModel = TestViewModel(name: "John", age: 34)
					view = View(viewModel: viewModel)
				}

				it("should not be nil") {
					expect(view).toNot(beNil())
				}

				it("should tick the view when a property is updated in the view model") {
					viewModel.update(name: "Steve")
					expect(view.ticked).to(beTrue())
					expect(view.listenerUpdated).to(beFalse())
					expect(viewModel.name) == "Steve"
				}
				
				it("should update the listener if subscribing again") {
					view.updateListener()
					viewModel.update(name: "Steve")
					expect(view.ticked).to(beTrue())
					expect(view.listenerUpdated).to(beTrue())
					expect(viewModel.name) == "Steve"
				}
				
				it("when unsubscribing should not tick the view anymore") {
					viewModel.unsubscribe(view)
					expect(view.ticked).to(beFalse())
					expect(view.listenerUpdated).to(beFalse())
					expect(viewModel.name) == "John"
				}
				
				it("should notify all observers") {
					secondaryView = View(viewModel: viewModel)
					viewModel.update(name: "Steve")
					expect(view.ticked).to(beTrue())
					expect(secondaryView.ticked).to(beTrue())
				}
			}
		}
	}
}

// MARK: - Private helpers

private class View {

	let viewModel: TestViewModel
	var ticked = false
	var listenerUpdated = false

	init(viewModel: TestViewModel) {
		self.viewModel = viewModel
		viewModel.subscribe(self) { [weak self] in
			self?.ticked = true
		}
	}
	
	func updateListener() {
		viewModel.subscribe(self) { [weak self] in
			self?.ticked = true
			self?.listenerUpdated = true
		}
	}
	
	func unsubscribe() {
		viewModel.unsubscribe(self)
	}
}
