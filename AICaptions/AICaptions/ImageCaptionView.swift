//
//  ImageCaptionView.swift
//  AICaptions
//
//  Created by ashima arora on 4/7/25.
//

//import Foundation
import SwiftUI
import PhotosUI


struct ImageCaptionView: View {
    @State private var generatedCaption: String = ""
    @State private var selectedItem: PhotosPickerItem?=nil
    @State private var selectedImage: UIImage? = nil
    @State private var isLoading = false
    
    let openAI = OpenAIService()
    var body: some View {
        NavigationView{
            VStack (spacing:20){
                if let selectedImage{
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .cornerRadius(12)
                }
                else{
                    Text("No Image Selected")
                }
                //PhotoPicker
                PhotosPicker(selection: $selectedItem, matching: .images){
                    Text("Choose Image")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .onChange(of: selectedItem, {oldValue, newValue in
                    Task{
                        if let data = try? await newValue?.loadTransferable(type: Data.self){
                            selectedImage = UIImage(data: data)
                        }
                    }})
                if selectedImage != nil{
                    Button(action:{
                        isLoading = true
                        generatedCaption = ""
                        openAI.generateCaptionsFromImage(from: selectedImage) { caption in
                            //completions callback function
                            DispatchQueue.main.async{
                                self.generatedCaption = caption
                                self.isLoading = false
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
                }
            }
            .padding()
            .navigationTitle("Image Input")
        }

    }
}

#Preview {
    ImageCaptionView()
}

