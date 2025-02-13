import SwiftUI
import Sharing
import Dependencies

struct ConfirmationView: View {
    var body: some View {
        ZStack {
            Color(red: 30/255, green: 30/255, blue: 30/255)
                .ignoresSafeArea()
        
            VStack(spacing: 30) {
                Spacer()
                Image("Splash_Graphic_CAPTOR")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.white)
                Text("Before signing up, we would like you to know that CAPTOR will not collect or use any of your data etc, etc")
                    .foregroundStyle(.white)
                    .padding()
                Spacer()
                
                VStack(spacing: 30) {
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
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
        }
    }
}

@Observable
final class ConfirmationModel {
    @ObservationIgnored @Shared(.signup) var signup
    
}

#Preview {
    ConfirmationView()
}
