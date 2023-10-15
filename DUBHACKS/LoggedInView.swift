//
//  LoggedInView.swift
//  DUBHACKS
//
//  Created by Caleb Swan on 10/15/23.
//

import SwiftUI


//Variables inside of each Item in the Feed.
struct FeedItem {
    let username: String
    let text: String
    let imageName: String
}


//Format to display the items
struct FeedItemView: View {
    let feedItem: FeedItem
    var body: some View {
        ZStack{
            
            Color(red: 232/255, green: 211/255, blue: 162/255)
            VStack(alignment: .leading){
                Text(feedItem.username)
                    .font(.headline)
                
                Image(feedItem.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:200)
                      
                Text(feedItem.text)
                    .font(.body)
            }
        }
        .padding(10)
    }
}

//This struct creates a data set of values (baseplate)
struct LoggedInView: View {
    
    @State private var path = CreatePostView()
    @State private var newPostTrue = false
    @State private var claimed = false
    
    let feedItems: [FeedItem] = [
        FeedItem(username: "calebis6@uw.edu", text: "Anyone's #red #sweatshirt ?", imageName: "redsweatshirt"),
        FeedItem(username: "alimj5@uw.edu", text: "I found this #backpack in #Powell #Library.", imageName: "backpack"),
        FeedItem(username: "raoa@uw.edu", text: "This was sitting against a #tree in the #quad.", imageName: "photo3")
        //this will be replaced with data from the cloud storage
    ]
    
    //Search Function
    @State private var searchQuery = ""
    @State private var filteredFeedItems: [FeedItem] = []
    
    
    //This is the scrolling feed
    var body: some View {
        NavigationView{
            ZStack{
                
                Color(red: 51/255, green: 0/255, blue: 111/255)
                    .ignoresSafeArea()
                VStack{
                    Text("UW Lost & Found")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    TextField("Search", text:$searchQuery)
                        .frame(width: 400, height: 20)
                        .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 50))
                            .foregroundColor(Color(.gray)))
                        .padding()
                        .foregroundColor(.black)
                    
                    List{
                        ForEach(feedItems, id: \.username) { item in
                            Section(header: Text("")){
                                FeedItemView(feedItem: item)
                                Button("Claim"){
                                    claimed = true
                                }
                                .frame(width: 70, height: 40)
                                .background(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50))
                                    .foregroundColor(Color(red: 145/255, green: 123/255, blue: 76/255)))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                NavigationLink(destination: ClaimView(), isActive: $claimed){
                                    EmptyView()
                                }
                            }
                            
                        }
                    }
                    
                    Button("New Post"){
                        newPostTrue = true
                    }
                    .frame(width: 70, height: 70)
                    .background(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50))
                        .foregroundColor(Color(red: 232/255, green: 211/255, blue: 162/255)))
                    .foregroundColor(Color(red: 145/255, green: 123/255, blue: 76/255))
                    .fontWeight(.bold)
                    NavigationLink(destination: CreatePostView(), isActive: $newPostTrue){
                        EmptyView()
                    }
                }
            }
        }
            .navigationBarBackButtonHidden(true)
    }
    func filterFeedItems(){
        filteredFeedItems = feedItems.filter { item in
            let textMatch = item.text.lowercased().contains(searchQuery.lowercased())
            return textMatch
        }
    }
}


#Preview {
    LoggedInView()
}
