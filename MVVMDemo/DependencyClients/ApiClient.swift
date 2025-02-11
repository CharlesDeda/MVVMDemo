import Dependencies
import DependenciesMacros
import Foundation

@DependencyClient
struct ApiClient {
    var login: () async throws -> User
    
    struct User: Codable, Equatable, Identifiable {
        let id: UUID
        let fullName: String
    }
}

extension ApiClient: DependencyKey {
    static var liveValue = ApiClient(
        login: {
            return User(id: UUID(), fullName: "Nick Deda")
        }
    )
}

extension DependencyValues {
  var api: ApiClient {
    get { self[ApiClient.self] }
    set { self[ApiClient.self] = newValue }
  }
}

