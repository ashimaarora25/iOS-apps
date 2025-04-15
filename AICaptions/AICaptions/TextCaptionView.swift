//
//  TextCaptionView.swift
//  AICaptions
//
//  Created by ashima arora on 4/7/25.
//
import SwiftUI


struct TextCaptionView: View{
    @State private var prompt = ""
    @State private var generatedCaptions: [String] = []
    @State private var isLoading = false
    @State private var showNoCaptionsMessage = false
    
    let openAI = OpenAIService()
    var body: some View {
        VStack(alignment: .center, spacing:18){
            Text("Describe your photo or vibe: ")
                .font(.headline)
            TextField("e.g. A sunny beach morning", text: $prompt)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action:{
                isLoading = true
                showNoCaptionsMessage = false
                generatedCaptions = []
                openAI.generateCaptionsFromText(from: prompt) { captions in
                    //completions callback function
                    DispatchQueue.main.async{
                        self.generatedCaptions = captions
                        self.isLoading = false
                        
                        if captions.isEmpty{
                            self.showNoCaptionsMessage = true
                        }
                    }
                    
                }
            }){
                //generate captions
                Text("Generate Captions")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            if isLoading{
                ProgressView("Generating...")
            }
            if showNoCaptionsMessage {
                Text("No captions found. Please try a different prompt.")
                    .foregroundColor(.red)
                    .padding()
            }
            //display a list on UI
            List(generatedCaptions, id: \.self){ caption in
                Text(caption)
                
            }
            
        }
        .padding()
        .navigationTitle("Text Prompt")
    }
}

#Preview{
    TextCaptionView()
}
