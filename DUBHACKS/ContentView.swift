//
//  ContentView.swift
//  DUBHACKS
//
//  Created by Caleb Swan on 10/14/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var login = false
    @State private var path = LoggedInView()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 51/255, green: 0/255, blue: 111/255)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Image("lostandfoundlogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:400)
                    
                    TextField("Enter UW Email: ", text: $username)
                        .font(Font.system(size: 20))
                        .padding()
                        .background(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(red: 232/255, green: 211/255, blue: 162/255)))
                        .frame(width: 300, height: 50)
                        .foregroundColor(.black)
                    
                    SecureField("Password: ", text: $password)
                        .font(Font.system(size: 20))
                        .padding()
                        .background(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(red: 232/255, green: 211/255, blue: 162/255)))
                        .frame(width: 300, height: 50)
                        .foregroundColor(.black)
                    
                    Button("Login"){
                        authorize()
                        print("login clicked")
                    }
                    .frame(width: 100, height: 50)
                    .foregroundColor(.gray)
                    .background(Color(red: 232/255, green: 211/255, blue: 162/255))
                    .cornerRadius(10)
                    .padding()
                    NavigationLink(destination: LoggedInView(), isActive: $login){
                        EmptyView()
                    }
                }
            }
        } // end body
    }
    func authorize(){
        if username.lowercased().hasSuffix("@uw.edu"){
            print("accepted")
            login = true
        } else {
            print("denied")
        }
    }
} // end contentView


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
