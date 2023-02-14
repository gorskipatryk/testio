public enum NetworkError: LocalizedError {
    case invalidUrl, invalidResponse, notFound, unauthorized, serverError, unknown

    public var errorDescription: String {
        switch self {
        case .invalidUrl:
            return "Invalid URL"
        case .invalidResponse:
            return "Response is invalid"
        case .notFound:
            return "Resource not found"
        case .unauthorized:
            return "Verification Failed"
        case .serverError:
            return "Server error"
        case .unknown:
            return "Unknown error"
        }
    }

    public var failureReason: String? {
        switch self {
        case .invalidUrl:
            return "The URL is invalid."
        case .invalidResponse:
            return "Response from server was invalid."
        case .notFound:
            return "There is nothing."
        case .unauthorized:
            return "Your username or password is incorrect."
        case .serverError:
            return "Server error."
        case .unknown:
            return "Unknown error."
        }
    }

    init?(from response: URLResponse) {
        guard let response = response as? HTTPURLResponse else {
            self = .invalidResponse
            return
        }
        switch response.statusCode {
        case 200:
            return nil
        case 404:
            self = .notFound
        case 401:
            self = .unauthorized
        case 500:
            self = .serverError
        default:
            self = .unknown
        }
    }
}
