public protocol TokenStoring {
    func save(token: String) throws
    func read() throws -> String?
    func delete() throws
}

public final class TokenStorage: TokenStoring {
    private struct Constants {
        static let serviceKey = "access-token"
        static let accountKey = "testio"
    }

    // MARK: - Initialization

    public init(keychainStorage: KeychainStoring = KeychainStorage()) {
        self.keychainStorage = keychainStorage
    }

    // MARK: - TokenStoring

    public func save(token: String) throws {
        let tokenData = Data(token.utf8)
        try keychainStorage.save(data: tokenData, service: Constants.serviceKey, account: Constants.accountKey)
    }

    public func read() throws -> String? {
        guard let tokenData = try keychainStorage.read(service: Constants.serviceKey, account: Constants.accountKey) else { return nil }
        return String(data: tokenData, encoding: .utf8)
    }

    public func delete() throws {
        try keychainStorage.delete(service: Constants.serviceKey, account: Constants.accountKey)
    }

    // MARK: - Private

    private let keychainStorage: KeychainStoring
}
