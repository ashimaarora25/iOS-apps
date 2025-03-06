//
//  ContentView.swift
//  WeSplit2
//
//  Created by ashima arora on 2/17/25.
//

import SwiftUI
//whenever @State value is changed, reinvoked body property -> reload UI to reflect changed state
struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10,15,20,25,0]
    
    //computed Property
    var totalPerPerson: Double{
        //calculate total per person here
        let peopleCount = Double(numberOfPeople+2) //+2 bc its off by 2, bc default is index 2 in an array from 2 to 99
        let tipSelection = Double(tipPercentage)
        
        return (checkAmount+((tipSelection*checkAmount)/100))/peopleCount
    }
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    //Ask Swift to give currency code for the user, if none present, then use USD
                    //Locale is a struct in iOS, responsible for storing all of the users region settings
                    TextField("Amount", value: $checkAmount, format:.currency(code:Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad) //start with keyboard containing numbers and decimal point
                    //selection here is indicating index in array 2..<100 bc for each is looping from 2..<100
                    Picker("Number of People", selection:$numberOfPeople){
                        ForEach(2..<100){ num in
                            Text("\(num) people")
                            
                        }.pickerStyle(.navigationLink)
                    }
                }
                Section("How much do you want to tip?"){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id:\.self){
                            Text($0, format:.percent)
                        }
                    }.pickerStyle(.segmented)
                }
                Section("Total per person"){
                    //show the entered check amount value
                    Text(totalPerPerson, format:.currency(code:Locale.current.currency?.identifier ?? "USD"))
                }
            }.navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
