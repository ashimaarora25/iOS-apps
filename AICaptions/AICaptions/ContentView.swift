//
//  ContentView.swift
//  AICaptions
//
//  Created by ashima arora on 4/2/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var caption = ""
    @State private var selectedItem: PhotosPickerItem?=nil
    @State private var selectedImage: UIImage? = nil
    var body: some View {
        NavigationStack{
            VStack(spacing: 30) {
                Text("How would you like to generate a caption?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                
                
                NavigationLink(destination: TextCaptionView()){
                    Label("Enter a Text Prompt", systemImage: "text.bubble")
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(12)
                }
                
               
                
                NavigationLink(destination:ImageCaptionView()){
                    Label("Upload an Image", systemImage: "photo")
                    .padding()
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(12)
                }
               //Spacer()
            }
            .padding()
            .navigationTitle("Captions.AI")
            
        }
    }
}

#Preview {
    ContentView()
}
