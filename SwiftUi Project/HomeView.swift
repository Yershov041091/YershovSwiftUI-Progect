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
            .padding(.horizontal, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                Text(section.title)
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.4), radius: 20, x: 0, y: 20)
    }
}
struct Section: Identifiable {
    
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    
    Section(title: "Дизайн в SwiftUI", text: "50 уроков", logo: "Logo SwiftUI", image: Image("1"), color: (Color.init(cgColor: .init(red: 0.2118, green: 0, blue: 0.7098, alpha: 1)))),
    Section(title: "Основы Swift", text: "30 уроков", logo: "Logo SwiftUI", image: Image("2"), color: .pink),
    Section(title: "Решение задач на языке Swift", text: "35 уроков", logo: "Logo SwiftUI", image: Image("2"), color: .blue)
]

