//
//  ProfileViewModel.swift
//  FollowMVVM
//
//  Created by lgc on 14/10/24.
//

import Foundation

class ProfileViewModel: ObservableObject{
    
    @Published var isFollowing = false
    @Published var userFollowers = String()
    
    var user = User(picture: "maria",
                    name: "Maria da Silva",
                    nick: "@maria_silva",
                    followers: 231)
    
    init(){
        loadFollowers()
    }
    
    func loadFollowers(){
        self.userFollowers = customizeNumber(value: user.followers)
    }
    
    func customizeNumber(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)"
    }
    
     func followToggle() {
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.followers += 1) : (self.user.followers -= 1)
        loadFollowers()
    }
}
