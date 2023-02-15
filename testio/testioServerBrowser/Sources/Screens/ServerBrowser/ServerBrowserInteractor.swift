protocol ServerBrowserInteracting { }

final class ServerBrowserInteractor: ServerBrowserInteracting {
    // MARK: - Initialization

    init(presenter: ServerBrowserPresenting) {
        self.presenter = presenter
    }

    // MARK: - Private

    private let presenter: ServerBrowserPresenting
}
