//
//  Home.swift
//  SwiftUi Project
//
//  Created by Alina Kasianova on 27.06.2022.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile = false
    
    var body: some View {
        
        ZStack {
            
            Color(UIColor.lightGray)
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                HStack {
                    Button(action:{
                        self.showProfile.toggle()
                    })
                {
                    Image("avatar")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
            }
                Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
            
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .scaleEffect(showProfile ? 0.88 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showProfile)
            .edgesIgnoringSafeArea(.all)
            
            menuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showProfile)
        }
}
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
