//
//  HomeView.swift
//  SwiftUi Project
//
//  Created by Alina Kasianova on 27.06.2022.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        
        VStack {
            HStack {
                AvatarView(showProfile: $showProfile)
            Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}
