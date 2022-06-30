//
//  Home.swift
//  SwiftUi Project
//
//  Created by Alina Kasianova on 27.06.2022.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile = false
    @State var viewState = CGSize.zero
    @State var showContent = false
    
    var body: some View {
        
        ZStack {
            
            Color(UIColor.init(_colorLiteralRed: 0.9373, green: 0.949, blue: 0.9569, alpha: 1))
                .edgesIgnoringSafeArea(.all)
                
            HomeView(showProfile: $showProfile, showContent: $showContent)
            
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .scaleEffect(showProfile ? 0.88 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showProfile)
            .rotation3DEffect(Angle(degrees: Double(showProfile ? (viewState.height/10) - 10 : 0)), axis: (x: 10, y: 0, z: 0))
            .edgesIgnoringSafeArea(.all)
            
            menuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: viewState)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showProfile)
                .onTapGesture {
                    self.showProfile.toggle()
                }
                .gesture(
                    DragGesture().onChanged{ value in
                        self.viewState = value.translation
                        if self.viewState.height > 90
                        {
                            self.showProfile = false
                        }
                    }
                        .onEnded{ value in
                            self.viewState = .zero
                        }
                )
            if showContent{
                
                Color.white
                    .edgesIgnoringSafeArea(.all)
                ContentView()
                
                VStack {
                    HStack{
                        Spacer()
                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36)
                            .foregroundColor(.white)
                            .background(.black)
                        .clipShape(Circle())
                    }
                    Spacer()
                }
                .offset(x: -20, y: -16)
                .transition(.move(edge: .top))
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0), value: showContent)
                .onTapGesture {
                    self.showContent = false

                }
            }
        }
}
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        
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
    }
}

let screen = UIScreen.main.bounds
