public enum KeychainError: LocalizedError {
    case saveFailed, fetchFailed, deleteFailed

    public var errorDescription: String? {
        switch self {
        case .saveFailed, .fetchFailed, .deleteFailed:
            return "Keychain error"
        }
    }

    public var failureReason: String? {
        switch self {
        case .saveFailed:
            return "Saving token failed"
        case .fetchFailed:
            return "Fetching token failed"
        case .deleteFailed:
            return "Deleting token failed"
        }
    }
}
