import SwiftUI
import Sharing
import Dependencies

@Observable
final class SignUpConfirmationModel {
    
    
}
struct SignupConfirmationView: View {
    @Bindable var model: SignupModel
    
    var body: some View {
        ZStack {
            Color(red: 30/255, green: 30/255, blue: 30/255)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer().frame(height: 50)
                Text("Are you sure you want to sign up?")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                HStack {
                    Text("Username")
                        .frame(alignment: .leading)
                        .foregroundStyle(.white)
                    Text(model.username)
                        .frame(alignment: .trailing)
                        .foregroundStyle(.white)
                }
                HStack {
                    Text("Email")
                        .frame(alignment: .leading)
                        .foregroundStyle(.white)
                    Text(model.email)
                        .frame(alignment: .trailing)
                        .foregroundStyle(.white)
                }
                Spacer().frame(height: 30)
                
                HStack {
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
                    Button(action: {
                        
                    }) {
                        Text("Back")
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: 175, maxHeight: 15)
                            .padding()
                            .background(Color(red: 40/255, green: 40/255, blue: 40/255))
                            .cornerRadius(8)
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    SignupConfirmationView(model: SignupModel())
}
