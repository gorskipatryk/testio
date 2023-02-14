public protocol KeychainStoring {
    func save(data: Data, service: String, account: String) throws
    func read(service: String, account: String) throws -> Data?
    func delete(service: String, account: String) throws
}

public final class KeychainStorage: KeychainStoring {
    // MARK: - Initialization

    public init(keychain: KeychainProtocol = Keychain()) {
        self.keychain = keychain
    }

    // MARK: - KeychainStoring

    public func save(data: Data, service: String, account: String) throws {
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary

        let status = keychain.add(query)
        guard status == errSecSuccess else { throw KeychainError.saveFailed }
    }

    public func read(service: String, account: String) throws -> Data? {
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary

        let keychainData = keychain.fetch(query)
        guard keychainData.status == noErr else { throw KeychainError.fetchFailed }
        return keychainData.item as? Data
    }

    public func delete(service: String, account: String) throws {
        let query = [
             kSecAttrService: service,
             kSecAttrAccount: account,
             kSecClass: kSecClassGenericPassword,
        ] as CFDictionary

        let status = keychain.delete(query)
        guard status == noErr || status == errSecItemNotFound else { throw KeychainError.deleteFailed }
    }

    // MARK: - Private

    private let keychain: KeychainProtocol
}
