//
//  ContentView.swift
//  KruizeCard
//
//  Created by Kruize Christensen on 3/11/24.
//

import SwiftUI
import Contacts
import ContactsUI

struct ContentView: View {
    @State private var isPresentingContactCard = false
    var body: some View {
        ZStack {
            Color(red: 0.20, green: 0.60, blue: 0.86)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("kruize")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5))
                    .onTapGesture {
                        self.isPresentingContactCard.toggle()
                    }
                Text("Kruize Christensen")
                    .font(Font.custom("PixelifySans-Regular", size: 35))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 23))
                Divider()
                InfoView(text: "(406)799-8121", imageName: "phone.fill", link: "tel:+14067998121")
                InfoView(text: "christensen.kruize@gmail.com", imageName: "envelope.fill", link: "mailto:christensen.kruize@gmail.com")
                InfoView(text: "www.kruizechristensen.com", imageName: "display", link: "https://www.kruizechristensen.com")
                CInfoView(text: "kruize-christensen", imageName: "linkedin", link: "https://www.linkedin.com/in/kruize-christensen/")
                CInfoView(text: "Tech-Wizz", imageName: "github", link: "https://github.com/Tech-Wizz")
                
                
            }
            .sheet(isPresented: $isPresentingContactCard) {
                ContactCardView()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct ContactCardView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            let contact = CNMutableContact()
            contact.givenName = "Kruize"
            contact.familyName = "Christensen"
            
            let image = #imageLiteral(resourceName: "kruize.jpeg")
            contact.imageData = image.jpegData(compressionQuality: 1.0)
            
            let phone = CNLabeledValue(label: CNLabelPhoneNumberiPhone, value: CNPhoneNumber(stringValue: "(406)799-8121"))
            contact.phoneNumbers = [phone]
            
            let email = CNLabeledValue(label: CNLabelWork, value: "christensen.kruize@gmail.com" as NSString)
            contact.emailAddresses = [email]
            
            let linkedinProfile = CNSocialProfile(urlString: "https://www.linkedin.com/in/kruize-christensen/", username: "kruize-christensen", userIdentifier: nil, service: CNSocialProfileServiceLinkedIn)
            let webpageURL = CNLabeledValue(label: CNLabelURLAddressHomePage, value: "https://www.kruizechristensen.com" as NSString)
            let githubProfile = CNSocialProfile(urlString: "https://github.com/Tech-Wizz", username: "Tech-Wizz", userIdentifier: nil, service: "GitHub")

            contact.socialProfiles = [CNLabeledValue(label: "LinkedIn", value: linkedinProfile), CNLabeledValue(label: "GitHub", value: githubProfile)]
            contact.urlAddresses = [webpageURL]
            
            // Set the birthday
            var birthday = DateComponents()
            birthday.calendar = Calendar(identifier: .gregorian)
            birthday.day = 7
            birthday.month = 2
            birthday.year = 2000
            contact.birthday = birthday
            
            let contactViewController = CNContactViewController(forNewContact: contact)
            contactViewController.contactStore = CNContactStore()
            contactViewController.delegate = context.coordinator
            
            
            return UINavigationController(rootViewController: contactViewController)
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            // Update the view controller if needed
        }
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        class Coordinator: NSObject, CNContactViewControllerDelegate {
            var parent: ContactCardView
            
            init(_ parent: ContactCardView) {
                self.parent = parent
            }
            
            func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
                viewController.dismiss(animated: true)
            }
        }
    }
    
}

