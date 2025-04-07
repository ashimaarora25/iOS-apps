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
    @State private var caption = ""
    @State private var selectedItem: PhotosPickerItem?=nil
    @State private var selectedImage: UIImage? = nil
    var body: some View {
        NavigationStack{
            VStack {
                if let selectedImage{
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                }
                else{
                    Text("No Image Selected")
                }
                //PhotoPicker
                PhotosPicker(selection: $selectedItem, matching: .images){
                    Text("Select an Image")
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
            }
            .padding()
            .navigationTitle("Captions.AI")
        }

    }
}

#Preview {
    ImageCaptionView()
}

