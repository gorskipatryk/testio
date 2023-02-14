public protocol KeychainProtocol {
    func add(_ dictionary: CFDictionary) -> OSStatus
    func fetch(_ query: CFDictionary) -> KeychainData
    func delete(_ query: CFDictionary) -> OSStatus
}

public final class Keychain: KeychainProtocol {
    // MARK: - Initialization

    public init() { }

    // MARK: - KeychainProtocol

    public func add(_ dictionary: CFDictionary) -> OSStatus {
        SecItemAdd(dictionary, nil)
    }

    public func fetch(_ query: CFDictionary) -> KeychainData {
        var item: AnyObject?
        let status = withUnsafeMutablePointer(to: &item) {
            SecItemCopyMatching(query, UnsafeMutablePointer($0))
        }
        return KeychainData(item: item, status: status)
    }

    public func delete(_ query: CFDictionary) -> OSStatus {
        SecItemDelete(query)
    }
}
