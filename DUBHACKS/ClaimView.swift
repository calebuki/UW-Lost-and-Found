//
//  ClaimView.swift
//  DUBHACKS
//
//  Created by Caleb Swan on 10/15/23.
//

import SwiftUI


struct ClaimView: View {
    @State private var message = ""
    @State private var sendback = false
    var body: some View {
        ZStack{
            
            Color(red: 51/255, green: 0/255, blue: 111/255)
                .ignoresSafeArea()
            VStack{
                Text("Claim Belonging")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
                
                TextEditor(text: $message)
                    .frame(width: 350, height: 600)
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 50))
                        .foregroundColor(Color(.gray)))
                    .foregroundColor(.black)
                    .padding()
                
                Button("Send Message!"){
                    sendback = true
                }
                    .padding()
                    NavigationLink(destination: LoggedInView(), isActive: $sendback){
                        EmptyView()
                }
                
            }
        }
        
    }
}

#Preview {
    ClaimView()
}
