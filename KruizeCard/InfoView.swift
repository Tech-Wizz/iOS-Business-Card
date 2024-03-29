//
//  InfoView.swift
//  KruizeCard
//
//  Created by Kruize Christensen on 3/11/24.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    let link: String
    
    var body: some View {
        Link(destination: URL(string: link)!, label: {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(height: 50)
                        .overlay(HStack{
                            Image(systemName: imageName).foregroundColor(Color(red: 0.20, green: 0.60, blue: 0.86))
                            Text(text)
                        })
                        .padding(.all)
                })
             }
}


#Preview (traits: .sizeThatFitsLayout) {
    InfoView(text: "Hello", imageName: "phone.fill", link: "tel:+1234567890")
}
