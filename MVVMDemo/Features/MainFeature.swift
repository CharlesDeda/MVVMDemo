//
//  MainFeature.swift
//  MVVMDemo
//
//  Created by Nick Deda on 2/11/25.
//

import SwiftUI
import Sharing

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
        Text(model.user?.fullName ?? "")
        
        Button("Logout") {
            model.logoutButtonTapped()
        }
    }
}

#Preview {
//    MainView(model: MainModel(user: User(id: UUID(), fullName: "KodyDeda")))
}
