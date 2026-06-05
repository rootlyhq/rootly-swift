import Testing
@testable import Rootly
import OpenAPIRuntime
import Foundation

@Test func defaultServerURL() {
    #expect(Rootly.defaultServerURL.absoluteString == "https://api.rootly.com")
}

@Test func bearerMiddlewareInjectsAuthHeader() async throws {
    let middleware = BearerMiddleware(token: "test-token-123")

    let (response, _) = try await middleware.intercept(
        .init(method: .get, scheme: "https", authority: "api.rootly.com", path: "/v1/incidents"),
        body: nil,
        baseURL: Rootly.defaultServerURL,
        operationID: "listIncidents",
        next: { request, body, url in
            #expect(request.headerFields[.authorization] == "Bearer test-token-123")
            return (.init(status: .ok), nil)
        }
    )

    #expect(response.status == .ok)
}
