//
//  TextCaptionView.swift
//  AICaptions
//
//  Created by ashima arora on 4/7/25.
//
import SwiftUI


struct TextCaptionView: View{
    @State private var prompt = ""
    var body: some View {
        VStack(alignment: .center, spacing:18){
            Text("Describe your photo or vibe: ")
                .font(.headline)
            TextField("e.g. A sunny beach morning", text: $prompt)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Generate Captions"){
                //generate captions
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle("Text Prompt")
    }
}

#Preview{
    TextCaptionView()
}
