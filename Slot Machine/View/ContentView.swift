//
//  ContentView.swift
//  Slot Machine
//
//  Created by MahDi SaeDi on 4/21/21.
//

import SwiftUI


struct ContentView: View {
// MARK: - PROPERTIES
    let symbols = ["gfx-bell","gfx-cherry","gfx-coin","gfx-grape","gfx-seven","gfx-strawberry"]
    @State private var highscore:Int = 0
    @State private var coins : Int = 100
    @State private var betAmount:Int = 10
    @State private var reels:Array=[0,1,2]
    @State private var showingInfoView : Bool = false
// MARK: - FUNCTIONS
    // SPIN THE REELS
    func spinReels(){
//        reels[0] = Int.random(in: 0...symbols.count-1)
//        reels[1] = Int.random(in: 0...symbols.count-1)
//        reels[2] = Int.random(in: 0...symbols.count-1)
        reels = reels.map({ _ in
            Int.random(in: 0...symbols.count-1)
        })
    }
    // CHECK THE WINNING
    func checkWinning(){
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2]{
            // PLAYER WINS
            playerWins()
            // NEW HIGHSCORE
            if coins > highscore{
                newHighScore()
            }
        }else{
            // PLAYER LOSES
            playerLoses()
        }
    }
    func playerWins(){
        coins += betAmount * 10
    }
    func newHighScore(){
        highscore = coins
    }
    func playerLoses(){
        coins -= betAmount
    }

    // GAME IS OVER
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
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack{
                        Text("\(highscore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                //MARK: - SLOT MACHINE
                VStack(alignment: .center, spacing: 0){
                    //MARK: - REEL #1
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    HStack(alignment: .center, spacing: 0){
                        //MARK: - REEL #2
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        Spacer()
                        //MARK: - REEL #3
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 500)
                    //MARK: - SPIN BUTTON
                    Button(action: {
                        // SPIN THE REELS
                        self.spinReels()
                        // CHECK WINNING
                        self.checkWinning()
                    }){
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }
                }// Slot Machine
                .layoutPriority(2)
                //MARK: - FOOTER
                Spacer()
                
                HStack{
                    //MARK: - BET 20
                    HStack(alignment:.center,spacing:10) {
                        Button(action:{
                            print("bet 20 coins")
                        }){
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                    
                    Image("gfx-casino-chips")
                        .resizable()
                        .opacity(0)
                        .modifier(CasinoChipsModifier())
                    }
                    //MARK: - BET 10
                    HStack(alignment:.center,spacing:10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(1)
                            .modifier(CasinoChipsModifier())
                        Button(action:{
                            print("bet 10 coins")
                        }){
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(.yellow)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                    
                    
                    }
                }
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
                    self.showingInfoView = true
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
        .sheet(isPresented: $showingInfoView){
            InfoView()
        }
    }
}
// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
