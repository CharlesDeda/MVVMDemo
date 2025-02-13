import SwiftUI
import Sharing
import Dependencies

@Observable
final class MainModel {
    @ObservationIgnored @Shared(.user) var user
    
    func logoutButtonTapped()  {
        $user.withLock {
            $0 = .none
        }
    }
}

struct MainView: View {
    @Bindable var model: MainModel
    
    var body: some View {
        ZStack {
            Color(red: 30/255, green: 30/255, blue: 30/255)
                .ignoresSafeArea()
            VStack {
                Text(model.user?.fullName ?? "")
                
                Button("Logout") {
                    model.logoutButtonTapped()
                }
            }
        }
    }
}

#Preview {
    MainView(model: MainModel())
}
