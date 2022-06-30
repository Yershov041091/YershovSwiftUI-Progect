//
//  HomeView.swift
//  SwiftUi Project
//
//  Created by Alina Kasianova on 27.06.2022.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @Binding var showContent: Bool
    
    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    AvatarView(showProfile: $showProfile)
                Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal, 14)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    RingsView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .onTapGesture {
                            self.showContent = true
                        }
                }
                
                
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
                .offset(y: -30)
                
                HStack {
                    Text("Курсы")
                        .font(.title)
                    .bold()
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -60)
                
                SectionView(width: screen.width - 60, height: 275, section: sectionData[1])
                    .offset(y: -60)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    var width: CGFloat = 275
    var height: CGFloat = 275
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
        .frame(width: width, height: height)
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


struct RingsView: View {
    var body: some View {
        HStack(spacing: 20) {
            HStack(spacing: 14){
                RingView(color1: Color.pink, color2: Color.blue, width: 44, height: 44, percent: 68, show: .constant(true), showCard: .constant(true))
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text("Осталось 7 минут")
                        .font(.subheadline)
                        .bold()
                    Text("Смотрел(ла) 15 минут сегодня")
                        .font(.caption)
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            
            HStack(spacing: 14){
                RingView(color1: Color.blue, color2: Color.orange, width: 32, height: 32, percent: 48, show: .constant(true), showCard: .constant(true))
                
                VStack(alignment: .leading, spacing: 4) {
                    
                }
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            
            HStack(spacing: 14){
                RingView(color1: Color.pink, color2: Color.green, width: 32, height: 32, percent: 32, show: .constant(true), showCard: .constant(true))
                
                VStack(alignment: .leading, spacing: 4) {
                    
                }
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        }
    }
}
