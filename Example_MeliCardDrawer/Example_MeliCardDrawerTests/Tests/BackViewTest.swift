import XCTest
@testable import Example_MeliCardDrawer
@testable import MLCardDrawer

class BackViewTest: XCTestCase {
    
    func testModelObservers() {
        let cardUI = CardUIMock()
        let model = CardDataMock()
        let backView = BackView()

        backView.setup(cardUI, model, .zero, true, customLabelFontName: nil)
        backView.model?.securityCode = "1"

        XCTAssertNotNil(backView.model)
        XCTAssert(backView.securityCode.text! == "1**")
    }

    func testCardUIDidChange() {
        let cardUI = CardUIMock()
        let model = CardDataMock()
        let backView = BackView()

        backView.setup(cardUI, model, .zero, true, customLabelFontName: nil)
        cardUI.securityCodePattern = 3
        backView.setupUI(cardUI)

        XCTAssert(backView.securityCode.text! == "***")
    }
}
