import SwiftUI
import Sharing
import Dependencies

@Observable
final class RevenueModel {
    @ObservationIgnored @Shared(.signup) var signup
}

struct RevenueFeature: View {
    @Bindable var model: RevenueModel
    @State var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            Color(red: 30/255, green: 30/255, blue: 30/255)
                .ignoresSafeArea()
            
            VStack(spacing: 34) {
                Text("Get Premium Access to All Features")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                
                Button(action: {
                    isSelected = true
                }) {
                    HStack {
                        Text("$2.99")
                            .foregroundColor(.white)
                            .bold()
                        
                        Spacer()
                        
                        Text("1 month")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 80)
                    .background(Color(red: 20/255, green: 20/255, blue: 20/255))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 6)
                }
                
                Button(action: {
                    isSelected = true
                }) {
                    Text("$14.99")
                        .foregroundColor(.white)
                        .bold()
                    
                    Spacer()
                    
                    Text("6 months")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 80)
                .background(Color(red: 20/255, green: 20/255, blue: 20/255))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 6)
                
                
                Button(action: {
                    isSelected = true
                }) {
                    Text("$24.99")
                        .foregroundColor(.white)
                        .bold()
                    
                    Spacer()
                    
                    Text("12 months")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 80)
                .background(Color(red: 20/255, green: 20/255, blue: 20/255))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 6)
                
                
                Button(action: {
                    isSelected = true
                }) {
                    Text("1 week free trial")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 80)
                .background(Color(red: 20/255, green: 20/255, blue: 20/255))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 6)
                
                Button(action: {
                    
                }) {
                    Text("Next")
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: 175, maxHeight: 15)
                        .padding()
                        .background(isSelected ? Color(.gray) : Color(red: 20/255, green: 20/255, blue: 20/255))
                        
                        .cornerRadius(8)
                }
                
                (Text("Subscription ")
                 + Text("terms").underline()
                 + Text(" of service"))
                .foregroundColor(.white)
                .bold()
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    RevenueFeature(model: RevenueModel())
}
