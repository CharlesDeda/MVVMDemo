import SwiftUI
import Sharing
import Dependencies

struct SignupFeature: View {
    @Bindable var model: SignupModel
    
    var body: some View {
        ZStack {
            Color(red: 30/255, green: 30/255, blue: 30/255)
                .ignoresSafeArea()
            
            VStack {
                Spacer().frame(height: 80)
                TextField("Username", text: $model.username)
                    .foregroundStyle(.white)
                    .padding()
                
                TextField("Email", text: $model.email)
                    .foregroundStyle(.white)
                    .padding()
                
                Spacer().frame(height: 60)
                
                Button(action: {
                    
                }) {
                    Text("Next")
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: 175, maxHeight: 15)
                        .padding()
                        .background(Color(red: 40/255, green: 40/255, blue: 40/255))
                        .cornerRadius(8)
                }
                Spacer()
            }
        }
    }
}


@Observable
final class SignupModel {
    @ObservationIgnored @Shared(.signup) var signup
    var username = ""
    var email = ""
}

#Preview {
    SignupFeature(model: SignupModel())
}
