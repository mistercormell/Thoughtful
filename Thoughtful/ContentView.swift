//
//  ContentView.swift
//  Thoughtful
//
//  Created by Cormell, David - DPC on 09/02/2023.
//

import SwiftUI

struct ContentView: View {
    let messages = ["I love you and I'm really missing you today x","You are my sunshine xxx", "I'm really lucky to be married to you xx",""]
    
    var body: some View {
        VStack {
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Button("Send Message") {
                createMessage()
            }
        }
        .padding()
    }
    
    func createMessage() {
        let body = messages.randomElement() ?? "You are my best friend xxxx"
        let smsString = "sms:+447717503458&body=\(body)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let smstoUrl = URL(string: smsString!)!
        if UIApplication.shared.canOpenURL(smstoUrl) {
                UIApplication.shared.open(smstoUrl, options: [:])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
