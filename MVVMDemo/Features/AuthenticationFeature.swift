import SwiftUI
import Sharing
import Dependencies

@Observable
final class AuthenticationModel {
    @ObservationIgnored @Shared(.user) var user
    @ObservationIgnored @Dependency(\.api) var api

    func loginButtonTapped() {
        Task {
            let result = await Result {
                try await self.api.login()
            }
            if case let .success(value) = result {
                $user.withLock {
                    $0 = value
                }
            }
        }
    }
}

struct AuthenticationView: View {
    @Bindable var model: AuthenticationModel
    
    var body: some View {
        Button("Login") {
            model.loginButtonTapped()
        }
    }
}

#Preview {
//    AuthenticationView(model: AuthenticationModel(onLogin: { _ in }))
}
