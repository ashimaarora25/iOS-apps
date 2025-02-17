//
//  LearningSwift.swift
//  ToDoList
//
//  Created by ashima arora on 12/25/24.
//


//Vars
func learningbasics(){
    var pname = "Ted"
    pname = "Rebecca"
    
    //constants use let
    let uname = "Ted "
    //print
    print(uname)
    
    //multi-line string
    
    let movie = """
    A day in
    the life
    """
    print(movie.count) //print how many letters in the string
    print(pname.hasPrefix("He")) //does string has a specific Prefix, hasSuffix also exists.
    
    //int for whole numbers
    let score = 10 //can add, subtract, etc. with these
    var counter = 10
    counter+=5
    
    print(counter.isMultiple(of: 3)) //check if number is a multiple of 3
    
    //random Int within the given range
    let id = Int.random(in: 1...1000)
    
    //double for decimal numbers
    let scores = 3.0
    //bool for true/false
    var goodNews = true
    goodNews.toggle() //turn boolean between true/false
    
    //String Interpolation
    let name = "Taylor"
    let age = 26
    let message = "I'm \(name) and I'm \(age) years old."
    
    //Arrays
    var colors = ["Red", "Green","Blue"]
    print(colors[2])
    colors.append("Orange") //must match value type of other items in the array
    //funcs: count and remove and contains
    colors.remove(at:0)
    print(colors.count)
    print(colors.contains("Purple"))
    
    //Dictionaries use keys and values
    let employee = [
        "name":"Taylor",
        "job": "Barista"
    ]
    
    //read value from a dictionary - like an array but instead of index, you give it a key
    print(employee["job",default:"Unknown"])
    
    //Sets are similar to arrays, but they can't add duplicate items and don't store things in a particular order like arrays
    var numbers = Set([1,1,3,5,7,9])
    print(numbers) //returns 1, 7,9,3,5 -> random order
    numbers.insert(10) //not append like arrays but insert
    
    //Enum is a set of named values that makes our code safer and efficient - instance day can only have values from this enum
    enum Weekday {
        case monday, tuesday, wednesday, thursday, friday
        
    }
    //instance of enum
    var day = Weekday.monday
    day = .friday //assigning another value to instance of enum
    
    //Type Annotation - force a specific type on a variable or constant
    var score1: Double = 0
    var isEnable: Bool = true
    var albums: Array<String> = ["Red", "Blue"]
    //alternatively, var albums: [String]=[]
    var users:Dictionary<String,Int> = ["age":12]
    //alternatively, var users: [String:Int] = []
    var books:Set<String> = Set(["The Blue","Yellow Pages"])
    //enums
    var day2: Weekday = .tuesday
    //empty arrays:
    var teams: [String] = [String]()
    var clues = [String]()
    
    //IF, ELSE IF, ELSE
    let agev = 16
    if agev > 1 && agev < 17{
        print("Can't vote")
    } else if agev < 18 {
        print("Can vote soon")
    } else{
        print("Can vote")
    }
    // SWITCH: Check one value against multiple conditions/cases
    
    enum Weather{
        case sun, rain, wind
    }
    let forecast = Weather.sun //initialize
    switch forecast { //check value of forecast against different values
    case .sun: //is it .sun because we assign values to enum with a . in the front, maybe reading the value is also with a .
        print("A nice day.")
    case .rain:
        print("A rainy day.")
    default: //must have a case for each value in enum or have a default case for all cases not handled
        print("Should be okay.")
    }
    
    //Ternary Conditional Operator
    let age2 = 18
    let canVote = age >=18 ? "Yes": "No"
    
    //For loops
    for album in albums {
        print("Album is \(album)")
    }
    //1 to 12 both inclusive. If 1..<12 then it would be 1 to 11
    for i in 1...12{
        print(i)
    }
    
    //While loop: give a condition and they run as long as condition is true
    var count = 10
    while count>0{
        print("Count is greater than 0")
        count-=1
    }
    
    //Functions
    func printTimesTable(num:Int){
        for i in 1...12{
            print("\(num) x \(i) is \(num*i)")
        }
        printTimesTable(num: 8) //specify parameter in function call
    }
    //returns an Int
    func rollDice() -> Int{
        return Int.random(in:1...1000) //or Int.random(in:1...1000)
    }
    let result = rollDice()
    
    //Tuples: store fixed number of items of specific types
    //convenient for returning multiple values from function
    //returns a tuple
    func getUser() -> (firstName:String,lastName:String){
        //return a tuple
        return (firstName: "Taylor", lastName: "Swift")
    }
    let user = getUser()
    //accessing(destructing) values of a tuple
    print("\(user.firstName),\(user.lastName)" )
    
    //alternatively:
    //let (firstName, _) = getUser()
    //print("\(firstName)")
    
    //Customizing parameter labels: If you don't want to pass a parameter name into a func, put an underscore before it.
    
    func isUpperCase(_ string: String) -> Bool{
        string == string.uppercased()
    }
    
    let string = "HELLO WORLD"
    let result = isUpperCase(string)//now, we don't say parameter name: value and just pass the value instead
    
    //Writing a second name before the first name,
    //first for external use and second for internal use
    func printTimesTable (for number:Int){
        for i in 1...12{
            //number used internally
            print("\(i) x \(number) is \(i * number)")
        }
    }
    //for used externally
    printTimesTable(for: 3)
    
    //Providing default values for parameters by using equals after the type name and giving a value
    //formal is a bool value that is false by default
    func greet(_ person: String, formal: Bool = false){
        if formal{
            print("Welcome \(person)")
        } else {
            print("Hi, \(person)")
        }
    }
    //call formal with greet or without
    greet("Tim", formal: true)
    greet("Taylor")
    
    //Handling errors in functions
    //Step 1: define the kinds of errors that can occur,
    //Step 2: write a func that throws one or more of those errors
    //Step 3: Call that func and handle its errors appropriately
   
    //Step 1: using built-in Error type
    enum PasswordError: Error{
       case short, obvious
    }
    //Step 2:
    //throws indicates that the func is able to throw errors
    func checkPassword(_ password: String) throws -> String{
        //count is a property of a string
        if password.count < 5{
            throw PasswordError.short
        }
        if password == "12345"{
            throw PasswordError.obvious
        }
        //less than 10 but not 5
        if password.count < 10{
            return "OK"
        }
        else {
            return "Good"
        }
        
        //Step 3: try keyword!
        //do the following: try this func which throws an error and do the required things with the result and catch any errors
        do {
            let result = try checkPassword("12345")
            //if there is an ERROR, it won't print the next line, it will go to catch
            print("Rating: \(result)")
        } catch PasswordError.obvious{
            print("Too obvious")
        } catch {
            //generic catch all: MUST HAVE
            print("There was an error.")
        }
        
        //Closures
        //Assign functionality directly to a constant or variable
        let sayHello = {
            print("Hi there!")
        }
        //sayHello is a closure - its a chunk of code that we can pass around and call whenever we want to
        sayHello()
        
        //closure that takes parameters
        // in keyword marks the end of our segment that contains parameters and return type
        //after in is the body of our closure
        let sayHello2 = { (name:String) -> String in
            "Hi, \(name)!" //returns String
        }
        
        let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]
        //filter is a built-in array function that takes a closure containing the filter condition.
        //inside the closure, we list the parameters we receive from filter function which is a string bc we apply filter on each element in array and return whether its true/false (take each element, get it through a test and return whether it passes the test).
        let onlyT = team.filter({(name: String) -> Bool in
            return name.hasPrefix("T")
        })
        print(onlyT) //new array
        
        /* Alternatively: shorter form
         //swift knows filter must receive an item from array which would be string type and would return a Bool so we don't need to specify
         let onlyT = team.filter({name in
         name.hasPrefix("T")
         })
         
         //Alternatively: Using Trailing closure syntax
         //remove the () after filter, launch into closure straight away
         let onlyT = team.filter{name in
         name.hasPrefix("T")
         }
         //Alternatively:Shorthand Syntax
         //instead of paramter names, use $0, $1,..
         let onlyT = team.filter{$0.hasPrefix("T")
         }
         */
        
        //Structs: they let us make our own/custom data types
        //with our own properties and methods like string has count for property and .uppercased() for method
        //26:40
        struct Album {
            let title: String
            let artist: String
            var isReleased = true
            
            func printSummary(){
                print("\(artist) by \(title)")
            }
            
            //In Swift, methods in struct and enums(value types) are by default not changeable (mutable). When you want to change the internal state/properties of a struct or enum inside a method, ex: value of isReleased, then use mutating keyword to change property of a struct or enum instance from within a method
            mutating func removeFromSale(){
                isReleased = false
            }
        }
        
        let red = Album(title: "Red", artist: "Taylor Swift") //member wise initializer - created by swift itself
        red.printSummary()
        
        struct Employee{
            let name: String
            var vacationAllowed = 14
            var vacationTaken = 0
            
            //Computed property calculates its value everytime it is accessed.
            var vacationRemaining: Int {
                //not a stored value, its calculated dynamically everytime
                get{
                    vacationAllowed - vacationTaken //this only gives us a value, we can never set/modify it, so maybe we can put it under get
                }
                set{
                    //newValue is provided by Swift and it stores to whatever the new value the user was trying to assign to this property (flipped the calc of new value in a different order)
                    vacationAllowed = vacationTaken + newValue
                }
            }
            
            //Property Observers are pieces of code that runs when a property changes
            //didSet is called AFTER the change has taken place
            //willSet is called BEFORE the change has taken place
            struct Game{
                var score = 0 {
                    //didSet that is called everytime the score property changes
                    didSet{
                        print("Score is now \(score)")
                    }
                }
            }
            
            var game = Game()
            game.score+=10
            game.score-=3
            
            //Initializers are special functions that run whenever a NEW INSTANCE of a struct is created. It ensures that all properties inside a struct have a value by the time it finishes. Swift makes a member wise initializer automatically but you can also make one yourself to have custom control.
            
            struct Player{
                let name: String
                let number: Int
                //INITIALIZER: no use of keyword func and it never returns a type. It implicitly returns a type of its struct (here: Player)
                init(name: String){
                    self.name = name
                    self.number = Int.random(1...99)
                }
            }
            
            //Access Control - 4 types inside a struct
            //1. Private: let nothing outside the struct read or write this
            //2. Private set: something outside can read it but cannot write it - only internal things can write it
            //private (set) var funds = 1000000
            //3. File private: Anything inside the current file can read and write it
            //4. Public: Anyone/Anywhere can read or write this
            
            //31:56 Static properties and methods - can add them to a struct type rather than a particular instance of a struct
            
            struct AppData{
                static let version ="1.3 beta 2"
            }
            //Anywhere I want to read the values (Static) ex: log files, I can directly read it instead of making an isntance of AppData and read it from there
            print(AppData.version)
            
            /* Classes let us create custom data types like structs
             but different in 5 main ways:
             1. When we make a class, we can make an inherit from or build upon another existing class (parent class), and the child class can inherit all methods and properties of the parent class */
            
            class Employee{
                let hours: Int
                
                init (hours:Int){
                    self.hours = hours
                }
                func printSummary(){
                    print("I work \(hours) hours a day.")
                }
            }
            
            //inherits from Employee all methods and properties
            class Developer: Employee{
                func work(){
                    print("I am coding for \(hours) hours a day")
                }
                
                //If a child class wants to change a method it got from a parent class, we must use override keyword
                override func printSummary(){
                    print("I spend \(hours) hours a day")
                }
            }
            
            let noval: Developer(hours: 8) //initializer
            noval.work()
            noval.printSummary()
            
            /*
             2. Swift will never make a generated initializer (member-wise) for our classes.
             If you give a child class its custom initializer, then it must always call the parent initializer after configuring its own properties.
             If a child class has no custom initializer, it will automatically inherit initializer from the parent.
             */
            class Vehicle{
                let isElectric: Bool
                
                init(isElectric:Bool){
                    self.isElectric = isElectric
                }
            }
            class Car: Vehicle{
                let isConvertible:Bool
                //initializer for subclass must accept isConvertible and isElectric
                init(isConvertible:Bool,isElectric:Bool){
                    self.isConvertible = isConvertible
                    super.init(isElectric: isElectric) //superclass's initializer, pass it the value for isElectric
                }
            }
            
            /*
             3. All copies of a class share one set of data, meaning if you change one instance, all copies of that instance are also updated
             */
            class Actor{
                var name = "Nicholas Cage"
            }
            var actor1 =  Actor() //instance of Actor
            var actor2 = actor1 //actor2 is a copy of actor1
            actor2.name = "Tom Cruise"
            //Both would be Tom Cruise, they both point to the same piece of data
            print(actor2.name)
            print(actor1.name)
            
            //Structs never share their data
            /*
             4. Classes can have a de-initializer if they need to -
             the last reference to an object is destroyed - this will be run automatically by the system
             */
            /*
             5. Classes let us change variable properties even if the class instance itself is constant
             so, classes don't need to have mutating keyword in front of methods that change class properties
             */
            
            class Singer{
                var name = "Adele"
            }
            let singer = Singer() //class instance is a constant
            singer.name = "Justin" //property inside the class is variable
            
            //Protocols: define functionality we expect other types to support and Swift will ensure they follow the property.
            
            protocol Vehicle1{
                //to be a Vehicle, you could have these methods and properties
                var name: String {get} //get meaning it might be a constant or computed property - only read
                var currentPassengers: Int {get set} //- read and write - might be variable or computed property
                //All types conforming to Protocol must add this getter and setter now!!
                
                /*
                 we list the required methods for this protocol to work but there is no code inside it - we are only specifying names, parameters, return types etc.
                 */
                //Recall: for is parameter name for external use
                //distance is parameter name for internal use
                func estimateTime(for distance: Int) -> Int
                func travel(distance:Int)
            }
            //40:38 You can make other types conform to a protocol by implementing the required functionality.
            //we make struct Car that conforms to the protocol Vehicle
            //can conform to multiple protocols by listing them out like Vehicle1, Vehicle2
            //If you want to subclass another class and conform to protocol, put class name first then protocols after ,
            struct Car: Vehicle1{
                let name = "Car" //get
                var currentPassengers = 1 //get/set
                func estimateTime(for distance: Int)-> Int{
                    distance/50
                }
                func travel(distance: Int){
                    print("I am driving \(distance) km")
                }
                //you can add other methods also but the protocol ones must exist bc protocol specifies the minimum func that should exist
            }
            //Once we have protocol, we can write a function that  accepts any kind of Vehicle (Car/Bike) as long as it conforms to Vehicle bc we know it has the 2 methods
            func commute(distance:Int, using vehicle: Vehicle1){
                //for is external name so we are using that here
                if vehicle.estimateTime(for:distance) > 100{
                    print("Too slow!")
                } else{
                    vehicle.travel(distance: distance)
                }
            }
            let car = Car() //instance
            commute(distance:100, using: car)
            //car.name
            //car.currentPassengers = 4
            
            //Extensions - let us add new functionality to any kind of type (ours (structs/class) or Apples's), can add computed properties to types
            
            extension String {
                //modifying Apple's existing func
                func trimmed() -> String{
                    self.trimmingCharacters(in: .whitespacesAndNewlines)
                } //call: let trimmedQuote = quote.trimmed()
                
                //if we wanted to change value within the function instead of returning it
                mutating func trim(){
                    self = self.trimmed()
                } //call: quote.trim()
                
                //computed property - want to get lines inside a string as an array of Strings
                
                var lines: [String]{
                    self.components(seperatedBy: .newlines)
                }
                
            }
            let lyrics = """
                    ghgjg
                    pejkd
                    """
            //lines is a property for strinfs that is computed dynamically
            print(lyrics.lines) //or lyrics.lines.count
            
            //we can use protocol extensions to add computed properties and methods to a whole protocol so any type conforming to the protocol gets access to them
            //ex: Arrays, Dictionaries and Sets all conform to same Protocol: Collection
            
            extension Collection {
                var isNotEmpty: Bool {
                    isEmpty == false
                }
            }
            
            let guests = ["Mario", "Peach"]
            if guests.isNotEmpty{
                print("Guest Count: \(guests.count)")
            }
            //This allows: 1. add the required methods in the protocol itself, i.e., those that must be conformed to
            // add default implementations of those methods inside protocol extension, so all conforming types to protocol get access to our default implementations, or they can override them in their own structs.
            
            //Optionals: represent the absence of data, its a difference between an integer holding value of 0 or nothing at all(nil).
            //data might be there or might not: type is String?. Any type can be optional. Swift won't let us use optional data directly because it might be empty, so we have to look inside the optional, i.e., unwrap it and if there is a value inside, use it.
            
            let opposites = [
                "Mario": "Luigi",
                "Luigi": "Waluigi"
            ]
            
            let peachOpposites = opposites["Peach"] //String?
            //unwrapping optional
            
            if let marioOpposite = opposites["Mario"]{
                //if value exists, its placed inside marioOpposite which is not optional anymore
                print("Mario's opposite is \(marioOpposite)")
            }
                //Another way: guard let
                //if let runs code inside braces if optional has a value (not nil), guard let runs code inside its brances if optional doesn't have a value.
                
                func printSquare(of number:Int?){
                    //can use guard somearray.isEmpty() else
                    guard let number = number else{
                        print("Missing input")
                        return //Swift requires you to exit if your test fails when using guard let
                    }
                    //here: we can use number as a non optional integer
                    print(number*number)
                }
                //Other unwrapping: Nil coalescing operator - unwrap optional, if its empty - it lets you provide a default value instead
                
                let tvShows = ["Archer", "Ted Lasso"]
                //If we read a random element from array, we get back an optional string bc array could have been empty
                
                let favorite = tvShows.randomElement() ?? "None"
                
                let input = ""
                let number = Int(input) ?? 0
                
                //Optionals chaining: reads optionals inside optionals
                
                let names = ["Arya","Bran","Robb"]
                //if optional has value inside then more code here: uppercased
                let chosen = names.randomElement()?.uppercased()
                print("Next in line: \(chosen ?? "No one")")
                
                //When calling a function that might throw errors, we can use an optional try: try? to convert any errors into optional nil and success with an optional that has a value inside
                
                enum UserError: Error{
                    case badID, networkFailed
                }
                
                func getUser(id: Int) throws ->String{
                    throw UserError.networkFailed
                }
                //we call getUser() - we don't care what comes back, we just care if it worked or not
                if let user = try? getUser(id: 23){
                    print("User found")
                }
                //if you want to know which error came back, have to use do, try, catch instead
