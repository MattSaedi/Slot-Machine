//
//  ContentView.swift
//  Slot Machine
//
//  Created by MahDi SaeDi on 4/21/21.
//

import SwiftUI
// MARK: - PROPERTIES

struct ContentView: View {
// MARK: - BODY
    var body: some View {
        ZStack {
            //MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"),Color("ColorPurple"),]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            //MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5){
                //MARK: - HEADER
                LogoView()
                Spacer()
                //MARK: - SCORE
                HStack {
                    HStack{
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        Text("100")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack{
                        Text("200")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                //MARK: - SLOT MACHINE
                //MARK: - FOOTER
                Spacer()
            }
            //MARK: - BUTTONS
            .overlay(
                // RESET
                Button(action:{
                    print("Reset the game")
                }){
                    Image(systemName: "arrow.2.circlepath.circle")
                }
                .modifier(ButtonModifier()),
                alignment: .topLeading
                
            )
            .overlay(
                // INFO
                Button(action:{
                    print("info View")
                }){
                    Image(systemName: "info.circle")
                }
                .modifier(ButtonModifier()),
                alignment: .topTrailing
                
            )
            .padding()
            .frame(maxWidth:720)
            //MARK: - POPUP
        }//:ZSTACK
    }
}
// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
