import SwiftUI
import Dependencies
import Sharing
import Combine
import SwiftUINavigation

/*
 Packages
 https://github.com/pointfreeco/swift-sharing
 https://github.com/pointfreeco/swift-issue-reporting
 https://github.com/pointfreeco/swift-dependencies
 https://github.com/pointfreeco/swift-navigation
 */

@MainActor
@Observable
final class AppModel {
    var destination: Destination? = nil
    @ObservationIgnored @Shared(.user) var user
    @ObservationIgnored @Shared(.signup) var signup
    
    @CasePathable
    enum Destination {
        case authentication(AuthenticationModel)
        case main(MainModel)
    }
    
    func task() async {
        for await _ in self.$user.publisher.values {
            self.destination = {
                switch user {
                case .some:
                    return .main(MainModel())
                case .none:
                    return .authentication(AuthenticationModel())
                }
            }()
        }
    }
}

struct AppView: View {
    @Bindable var model = AppModel()
    
    var body: some View {
        Group {
            switch model.destination {
            case let .authentication(model):
                AuthenticationView(model: model)
            case let .main(model):
                MainView(model: model)
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
