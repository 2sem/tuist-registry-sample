import Foundation
import Alamofire

/// A network client that demonstrates using Alamofire from the registry
public class NetworkClient {
    private let session: Session

    public init(session: Session = .default) {
        self.session = session
    }

    /// Fetch data from a URL
    public func fetch<T: Decodable>(
        from url: URL,
        as type: T.Type
    ) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            session.request(url)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        continuation.resume(returning: value)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }

    /// Simple GET request
    public func get(from url: URL) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            session.request(url)
                .validate()
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        continuation.resume(returning: data)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
