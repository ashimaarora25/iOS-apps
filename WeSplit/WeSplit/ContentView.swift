//
//  ContentView.swift
//  WeSplit
//
//  Created by ashima arora on 2/12/25.
//

import SwiftUI //all functionality given to us by SwiftUI framework
//Initial UI for app
//struct conforms to View Protocol
//anything that must drawn to screen must conform to View Protocol, ex: text, button, sliders
//View protocol has only one requirement - to have computed body property that returns some View
struct ContentView: View {
    @State private var tapCount = 0 //@State is for simple properties that are stored in one view and use private to signal that they are only used and made in that view
    @State private var name = ""
    //makes a new Computed property called body
    //some View means it returns some kind of data that conforms to the View Protocol
    let students = ["Harry", "Hermione","Ron"]
    @State private var selectedStudent = "Harry" //default value
    var body: some View {
        //special view type containing scrollable list of static controls like text or images and can have user input like text box or radio buttons
        NavigationStack{
            Form{
                Section{
                    //two-way binding: read value from UI to name and write back any changes from name to the UI
                    //@State will change in name -> change text field (UI).
                    // But, we need change text field ->  change string name, so $name to indicate two way binding.
                    TextField("Enter your name", text: $name) //need to know where to store the text in text field to display it, so the text to display comes from string name
                    Text("Hello, \(name)") //read value
                }
                Section{
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                //display a bunch of UIs
                ForEach(0..<3){ number in
                    Text("Row \(number)")
                    
                }
            }
            .navigationTitle("Swift UI")
            //smaller title: .navigationBarTitleDisplayMode(.inline)
        }
    
        NavigationStack{
            Form{
                Picker("Select your student", selection: $selectedStudent) {
                    //current selection like current text and its a two way binding
                    //SwiftUi needs to be able to uniquely identify every view on the screen, so it can spot when things change, so we have id
                    //with array of structs, the title of struct is always unique, here array of strings, the unique thing is the string itself
                    //ForEach one a view will be created, each will be unique and what makes it unique? self. But this won't work well if duplicate strings existed in array
                    ForEach(students, id: \.self){
                        Text($0) //$0 means current?
                    }
                }
            }.navigationTitle("Select a student")
        }
        Button("Tap Count: \(tapCount)"){
            tapCount+=1
        }
    }
}

//won't be code that is part of final app, but its just to Xcode at Design time
#Preview {
    ContentView()
}
