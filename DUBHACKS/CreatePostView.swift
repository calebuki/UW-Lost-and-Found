//
//  CreatePostView.swift
//  DUBHACKS
//
//  Created by Caleb Swan on 10/15/23.
//

import SwiftUI

struct CreatePostView: View {
    @State private var uploadedImage: Image?
    @State private var description = ""
    
    var body: some View {
        VStack {
            Button("Select Image"){
                //implement image picker
            }
            .padding()
            
            if uploadedImage != nil {
                uploadedImage?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:200)
            }
            
            TextEditor(text: $description)
                .frame(minHeight: 100)
            
            Button("Post"){
                //
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(50)
        }
        .navigationBarTitle("Create Post", displayMode: .inline)
    }
}

#Preview {
    CreatePostView()
}
