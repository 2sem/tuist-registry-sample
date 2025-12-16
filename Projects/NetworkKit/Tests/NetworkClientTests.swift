import XCTest
@testable import NetworkKit

final class NetworkClientTests: XCTestCase {
    var client: NetworkClient!

    override func setUp() {
        super.setUp()
        client = NetworkClient()
    }

    override func tearDown() {
        client = nil
        super.tearDown()
    }

    func testNetworkClientInitialization() {
        XCTAssertNotNil(client, "NetworkClient should be initialized")
    }

    // Add more tests as needed
}
