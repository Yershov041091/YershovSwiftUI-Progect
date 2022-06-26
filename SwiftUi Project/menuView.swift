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
            MenuRow(title: "Личный кабинет", icone: "gear")
            MenuRow(title: "Счет", icone: "creditcard")
            MenuRow(title: "Выход", icone: "person.crop.circle")
        }
        .frame(maxWidth: .infinity)
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
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 120, alignment: .leading)
        }
    }
}
