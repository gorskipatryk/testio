@testable import testioAuth
import testioCommon
import XCTest

final class LoginPresenterSpec: XCTestCase {

    var sut: LoginPresenter!
    var alertPresenterSpy: AlertPresenterSpy!
    var loginRouterSpy: LoginRouterSpy!

    override func setUpWithError() throws {
        alertPresenterSpy = AlertPresenterSpy()
        loginRouterSpy = LoginRouterSpy()
        sut = LoginPresenter(router: loginRouterSpy, alertPresenter: alertPresenterSpy)
    }

    override func tearDownWithError() throws {
        alertPresenterSpy = nil
        loginRouterSpy = nil
        sut = nil
    }

    func test_whenPresentServerListCalled() throws {
        sut.presentServerList()
        XCTAssertEqual(loginRouterSpy.navigateToServerListInvokedCount, 1)
    }

    func test_whenPresentAlertInvoked() throws {
        let title = "Title"
        let subtitle = "Subtitle"
        sut.presentAlert(title: title, subtitle: subtitle)
        XCTAssertEqual(alertPresenterSpy.caughTitle, title)
        XCTAssertEqual(alertPresenterSpy.caughtSubtitle, subtitle)
    }
}
