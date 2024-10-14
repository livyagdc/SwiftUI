//
//  ProfileView.swift
//  FollowMVVM
//
//  Created by lgc on 14/10/24.
//

import SwiftUI

//MARK: - VIEW
struct ProfileView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel

    var body: some View {
        
        VStack {
            ProfileDataView()
            ActionView()
        }
        .animation(.easeInOut, value: viewModel.isFollowing)
    }
        
}

struct ProfileDataView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        Image(viewModel.user.picture)
            .resizable()
            .frame(width: 250, height: 250)
            .padding(.bottom, 10)
        //                .cornerRadius(200)
            .clipShape(Circle())
        
        Text(viewModel.user.name)
            .font(.system(size: 50, weight: .bold))
        
        Text(viewModel.user.nick)
            .font(.system(size: 23, weight: .regular))
            .foregroundColor(.gray)
        
        Text(viewModel.userFollowers)
            .font(.system(size: 80, weight: .light))
            .padding(viewModel.isFollowing ? 40 : 25)
    }
}

struct ActionView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            Button{ viewModel.followToggle() } label: {
                Label(!viewModel.isFollowing ? "follow" : "unfollow", systemImage: "person.crop.circle")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!viewModel.isFollowing ? .blue : .black)
            
            Button{} label: {
                Label("enviar mensagem", systemImage: "paperplane.fill")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!viewModel.isFollowing)
        }
        .padding(20)
    }
}

#Preview {
    ProfileView()
        .environmentObject(ProfileViewModel())
}
