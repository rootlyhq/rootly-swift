import OpenAPIRuntime
import OpenAPIURLSession
import Foundation
import HTTPTypes

public let defaultServerURL = URL(string: "https://api.rootly.com")!

public func makeClient(
    token: String,
    serverURL: URL = defaultServerURL,
    transport: any ClientTransport = URLSessionTransport()
) -> Client {
    Client(
        serverURL: serverURL,
        transport: transport,
        middlewares: [BearerMiddleware(token: token)]
    )
}

struct BearerMiddleware: ClientMiddleware {
    let authorizationHeaderValue: String

    init(token: String) {
        self.authorizationHeaderValue = "Bearer \(token)"
    }

    func intercept(
        _ request: HTTPRequest,
        body: HTTPBody?,
        baseURL: URL,
        operationID: String,
        next: @Sendable (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?)
    ) async throws -> (HTTPResponse, HTTPBody?) {
        var request = request
        request.headerFields[.authorization] = authorizationHeaderValue
        return try await next(request, body, baseURL)
    }
}
