import SwiftUI
import Dependencies
import Sharing

/*
 Packages
 https://github.com/pointfreeco/swift-sharing
 https://github.com/pointfreeco/swift-issue-reporting
 https://github.com/pointfreeco/swift-dependencies
 https://github.com/pointfreeco/swift-navigation
 */

enum Destination {
    case authentication
    case main(User)
}

@MainActor
@Observable
final class AppModel {
    var user: User?
    var destination: Destination? = nil
    
    func task() async {
        let result = await Result {
            try await fetchCurrentUser()
        }
        
        self.destination = {
            switch result {
            case let .success(value):
                return .main(value)
            case .failure:
                return .authentication
            }
        }()
    }
        
    private func fetchCurrentUser() async throws -> User {
        return User(id: UUID(), fullName: "NickDeda")
    }
    
    func onLogout() {
        self.destination = .authentication
    }
    
    func onLogin(user: User) {
        self.destination = .main(user)
    }
    
}

struct AppView: View {
    @Bindable var model = AppModel()
    
    var body: some View {
        Group {
            switch model.destination {
            case .authentication:
                AuthenticationView(model: AuthenticationModel(onLogin: { user in
                    self.model.onLogin(user: user)
                }))
            case let .main(user):
                MainView(model: MainModel(user: user, onLogout: {
                    self.model.onLogout()
                }))
            case nil:
                ProgressView()
            }
        }
        .task {
            await model.task()
        }
    }
}

#Preview {
    AppView()
}
