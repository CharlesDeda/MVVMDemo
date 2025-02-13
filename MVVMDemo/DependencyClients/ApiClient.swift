import Dependencies
import DependenciesMacros
import Foundation
/*
 
 */

@DependencyClient
struct ApiClient {
    /**
     login with email for user, login with pin (password)
     This user will eventually reside in our server somewhere
     */
    var login: (_ email: String, _ pin: String) async throws -> User
    
    /**
     Create a local user or structure with the bits that are required for this user to exist.
     This user will eventually reside in our server somewhere
     Return true if it worked.
     
     Here you might want to validate this info, say the guy signing up is the one he claims.
     And you might send him an email to make sure these are not drones.
     But at some point they are signed
     After which they can login and use the app
     */
    // TODO: where is the real server api for this ?
    var signup: (_ signupInfo: SignUp) async throws -> Bool
    
    struct User: Codable, Equatable, Identifiable {
        let id: UUID
        let fullName: String
        let emailAddress: String
        let subscriptionType: SubscriptionType
    }
    
    enum SubscriptionType: Codable, Equatable {
        case unknown
        case oneWeekTrial(created: Date)
    }

    struct SignUp: Codable, Equatable {
        var fullName: String = ""
        var emailAddress: String = ""
        var subscriptionType: SubscriptionType = .unknown
    }
}

extension ApiClient: DependencyKey {
    static var liveValue = ApiClient(
        login: { _, _ in
            return User(id: UUID(), fullName: "Nick Deda", emailAddress: "Charlesdeda31@gmail.com", subscriptionType: .oneWeekTrial(created: .init()))
        },
        signup: { _ in
            return true
        }
    )
}

extension DependencyValues {
  var api: ApiClient {
    get { self[ApiClient.self] }
    set { self[ApiClient.self] = newValue }
  }
}

extension ApiClient.SignUp: DependencyKey {
    static var liveValue = ApiClient.SignUp()
}

