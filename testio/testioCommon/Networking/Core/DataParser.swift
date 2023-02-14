public protocol DataParserProtocol {
    func decode<T: Codable>(data: Data) throws -> T
}

public final class DataParser: DataParserProtocol {
    // MARK: - Initialization

    public init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
    }

    // MARK: - DataParserProtocol

    public func decode<T: Codable>(data: Data) throws -> T {
        try jsonDecoder.decode(T.self, from: data)
    }

    // MARK: - Private

    private let jsonDecoder: JSONDecoder
}
