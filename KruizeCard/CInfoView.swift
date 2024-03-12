//
//  CInfoView.swift
//  KruizeCard
//
//  Created by Kruize Christensen on 3/12/24.
//


import SwiftUI

struct CInfoView: View {
    
    let text: String
    let imageName: String
    let link: String
    
    var body: some View {
        Link(destination: URL(string: link)!, label: {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(height: 50)
                .overlay(HStack{
                    Image(imageName)
                        .resizable() // Make the image resizable
                        .aspectRatio(contentMode: .fit) // Preserve the aspect ratio
                        .frame(width: 25, height: 25) // Set the desired size
                        .foregroundColor(Color(red: 0.20, green: 0.60, blue: 0.86))
                    
                    Text(text)
                })
                .padding(.all)
        })
    }
}

struct CInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CInfoView(text: "LinkedIn", imageName: "linkedin", link: "https://linkedin.com")
            .previewLayout(.sizeThatFits)
    }
}
