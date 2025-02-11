//
//  MainFeature.swift
//  MVVMDemo
//
//  Created by Nick Deda on 2/11/25.
//

import SwiftUI

@Observable
final class MainModel {
    var user: User
    var onLogout: () -> Void
    
    init(
        user: User,
        onLogout: @escaping () -> Void
    ) {
        self.user = user
        self.onLogout = onLogout
    }
    
    func logoutButtonTapped()  {
        self.onLogout()
    }
}

struct MainView: View {
    @Bindable var model: MainModel
    
    var body: some View {
        Text(model.user.fullName)
        
        Button("Logout") {
            model.logoutButtonTapped()
        }
    }
}

#Preview {
    MainView(model: MainModel(user: User(id: UUID(), fullName: "KodyDeda"), onLogout: {}))
}
