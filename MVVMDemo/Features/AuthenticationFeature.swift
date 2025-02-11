//
//  AuthenticationFeature.swift
//  MVVMDemo
//
//  Created by Nick Deda on 2/11/25.
//

import SwiftUI
import Sharing

@Observable
final class AuthenticationModel {
    @ObservationIgnored @Shared(.user) var user

    func loginButtonTapped() {
        Task {
            let result = await Result {
                try await fetchCurrentUser()
            }
            if case let .success(value) = result {
                $user.withLock {
                    $0 = value
                }
            }
        }
        
    }
    
    private func fetchCurrentUser() async throws -> User {
        return User(id: UUID(), fullName: "NickDeda")
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
