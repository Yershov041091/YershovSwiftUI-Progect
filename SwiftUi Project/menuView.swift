//
//  menuView.swift
//  SwiftUi Project
//
//  Created by Alina Kasianova on 26.06.2022.
//

import SwiftUI

struct menuView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("Artem - обучение завершено на 23%")
                    .font(.caption)
                
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background((Color.black).opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                MenuRow(title: "Личный кабинет", icone: "gear")
                MenuRow(title: "Счет", icone: "creditcard")
                MenuRow(title: "Выход", icone: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(.init(red: 0.8431, green: 0.9176, blue: 0.9686, alpha: 1)), Color(.init(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
        .padding(.horizontal, 30)
        .overlay(
            Image("avatar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .offset(y: -150)
        )
        }
        .padding(.bottom, 30)
    }
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
    }
}

struct MenuRow: View {
    
    var title: String
    var icone: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icone)
                .font(.system(size: 20, weight: .light, design: .default))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color.gray)
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 120, alignment: .leading)
        }
    }
}
