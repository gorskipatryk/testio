import testioAuth
import UIKit

protocol EntryPointDeciding {
    func entryPoint() -> UIViewController
}

final class EntryPointDecider: EntryPointDeciding {
    // MARK: - Initialization

    init(loginFactory: LoginFactoring) {
        self.loginFactory = loginFactory
    }

    // MARK: - EntryPointDeciding

    func entryPoint() -> UIViewController {
        loginFactory.makeLoginScreen()
    }

    // MARK: - Private

    private let loginFactory: LoginFactoring
}
