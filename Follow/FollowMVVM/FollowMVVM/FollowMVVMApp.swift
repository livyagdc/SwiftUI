//
//  FollowMVVMApp.swift
//  FollowMVVM
//
//  Created by lgc on 14/10/24.
//

import SwiftUI

@main
struct FollowMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            ProfileView()
                .environmentObject(ProfileViewModel())
        }
    }
}
