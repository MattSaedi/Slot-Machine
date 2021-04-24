//
//  InfoView.swift
//  Slot Machine
//
//  Created by MahDi SaeDi on 4/24/21.
//

import SwiftUI


struct InfoView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    // MARK: - BODY
    var body: some View {
        VStack(alignment:.center,spacing:10) {
            LogoView()
            Spacer()
            Form{
                Section(header:Text("About the Application")){
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "Matt Saedi")
                    FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
                    FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
                    FormRowView(firstItem: "Copyright", secondItem: "© 2021 All rights reserved.")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                }
            }//:Form
            .font(.system(.body,design:.rounded))
        }//:VStack
        .padding(.top,40)
        .overlay(
            Button(action:{
                // Action
                self.presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
            .padding(.top,30)
            .padding(.trailing,20)
            .accentColor(.secondary)
            ,alignment: .topTrailing
        )
    }
}
// MARK: - FORMROWVIEW
struct FormRowView: View {
    var firstItem:String
    var secondItem:String
    var body: some View {
        HStack{
            Text(firstItem).foregroundColor(.gray)
            Spacer()
            Text(secondItem)
        }
    }
}
// MARK: - PREVIEW
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

