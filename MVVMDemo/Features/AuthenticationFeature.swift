import SwiftUI
import Sharing
import Dependencies

@Observable
final class AuthenticationModel {
    @ObservationIgnored @Shared(.user) var user
    @ObservationIgnored @Dependency(\.api) var api
    @ObservationIgnored @Shared(.signup) var signup

    func loginButtonTapped() {
        Task {
            let result = await Result {
                try await self.api.login("", "")
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
        ZStack {
            Color(red: 30/255, green: 30/255, blue: 30/255)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("Splash_Graphic_CAPTOR")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.white)
                Spacer()
                
                VStack(spacing: 40) {
                    Button(action: {
                        model.loginButtonTapped()
                    }) {
                        Text("Login")
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: 175, maxHeight: 15)
                            .padding()
                            .background(Color(red: 40/255, green: 40/255, blue: 40/255))
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Text("Sign Up")
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: 175, maxHeight: 15)
                            .padding()
                            .background(Color(red: 40/255, green: 40/255, blue: 40/255))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    AuthenticationView(model: AuthenticationModel())
}
