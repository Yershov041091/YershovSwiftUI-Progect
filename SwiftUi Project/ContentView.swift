//
//  ContentView.swift
//  SwiftUi Project
//
//  Created by Alina Kasianova on 23.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var ViewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .offset(y: showCard ? -200 : 0)
                .animation(Animation
                    .default
                    .delay(0.1)
                           ,value: self.showCard)
            
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(show ? Color.init(cgColor: .init(red: 0.9373, green: 0, blue: 0.6706, alpha: 1)) : Color.init(cgColor: .init(red: 0.2118, green: 0, blue: 0.7098, alpha: 1)))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -360 : -40)
                .offset(x: ViewState.width, y: ViewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(Animation
                    .easeInOut(duration: 0.6), value: self.show || self.showCard)
            
            BackCardView()
                .frame(width: 340, height: 220)
                .background(show ? Color.init(cgColor: .init(red: 0.2118, green: 0, blue: 0.7098, alpha: 1)) : Color.init(cgColor: .init(red: 0.9373, green: 0, blue: 0.6706, alpha: 1)))
                .cornerRadius(20)
                .offset(x: 0, y: -40)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -190 : -20)
                .offset(x: ViewState.width, y: ViewState.height)
                .offset(y: showCard ? -160 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 5, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.4), value: self.show || self.showCard)
            
            CardView()
                .frame(width: showCard ? 375 : 340, height: 220)
                .background(Color.black)
                //.cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: ViewState.width, y: ViewState.height)
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: self.show)
                .onTapGesture {
                    self.showCard.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged {value in
                        self.ViewState = value.translation
                        self.show = true
                    }
                        .onEnded {value in
                            self.ViewState = .zero
                            self.show = false
                        }
                )
            
           // Text("\(self.bottomState.height)").offset(y: -300)
            
            ButtomCardView()
                .offset(x: 0, y: showCard ? 350 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: self.showCard)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                        self.bottomState = value.translation
                            if self.showFull
                            {
                            self.bottomState.height += -300
                            }
                    }
                        .onEnded { value in
                            
                            if self.bottomState.height > 100
                            {
                                self.showCard = false
                            }
                            if self.bottomState.height < -110
                            {
                                self.bottomState.height = -300
                                self.showFull = true
                            }
                            else
                            {
                                self.bottomState = .zero
                                self.showFull = false
                            }
                        }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Дизайн SwiftUI")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("Сертификат")
                        .foregroundColor(Color("Primary"))
                }
                
                Spacer()
                
                Image("Logo SwiftUI")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Image("2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(width: 340, height: 220)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack{
                Text("Сертификаты")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            .padding()
            
            Spacer()
        }
    }
}

struct ButtomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("Изучение особенностей разработки адаптивного дизайна в SwiftUI")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color("Background 3"))
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
