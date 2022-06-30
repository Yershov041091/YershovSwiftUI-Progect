//
//  RingView.swift
//  SwiftUi Project
//
//  Created by Alina Kasianova on 29.06.2022.
//

import SwiftUI

struct RingView: View {
    var color1 = Color.red
    var color2 = Color.blue
    var width: CGFloat = 78
    var height: CGFloat = 78
    var percent: CGFloat = 80
    @Binding var show: Bool
    @Binding var showCard: Bool
    
    var body: some View {
        
        let multiplier = width / 44
        let progres = 1 - (percent / 100)
        
       return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle.init(lineWidth: 5 * multiplier))
                    .frame(width: width, height: height)
            
            Circle()
               .trim(from: show ? progres : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topTrailing, endPoint: .bottomLeading), style: StrokeStyle(lineWidth: 5 * multiplier))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
            .shadow(color: color2.opacity(0.2), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            //.animation(Animation.easeOut.delay(0.4), value: show)
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true), showCard: .constant(true))
    }
}
