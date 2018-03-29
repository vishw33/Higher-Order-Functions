import Foundation

/*:
## Higher Order Functions
* map(_:)
* flatmap(_:)
* filter(_:)
* sorted(_:)
* Reduce
*/

//: #### Using map()
//: ## map is a function type used with emulator objects like array,dictionary,sets. It can apply function to every individual object in a emulatable object

let houseName:[String] = ["starks" ,"lanniesters" , "targaryens" ,"baratheon" , "arryn"]

//: lets say now we need to count the number of texts in each element and we need that result in corresponding array
func count(house:[String]) -> [Int]
{
    var countArray = [Int]()
    for item  in house
    {
        countArray.append(item.count)
    }
    return countArray
}
let houseCount = count(house: houseName)
print(houseCount)

//: In above you are writing your function where the array is passed and then items are counted
//: But in case of map every thing can be done in single line
let mappedHouseCount = houseName.map{$0.count}
print(mappedHouseCount)

let check = houseCount == mappedHouseCount //: you are getting similar result just with single line of code
print(check)

//: Map Can be used to any function lets say we need all upper case letters
let upperCaseHouse = houseName.map { $0.uppercased()}
print(upperCaseHouse)

//: Maps can also be associated with user written function
let numberArray:[Int] = [2,5,10,15,20]

extension Int
{
    func factorial() -> Int
    {
        var fact: Int = 1
        for i in 1...self{
            fact = fact * i
        }
        return fact
    }
}
let factorialResult = numberArray.map{$0.factorial()}
print(factorialResult)

//: Maps can also be used for bollean decission like as below
let grade:[Int] = [30,45,50,100,12,28,46,31,34]
let boolVal:[Bool] = grade.map{$0 >= 35 ? true :false }
print(boolVal)

//: for-each is same as map but doesnt return any thing and it iterates in same order as array items where its not guarrented in map()
houseName.forEach{print($0)}

//: ### Using flatmap()
//: ## flatmap is same as map with optional handling capability

let place:[String?] = ["winterfell" , "highgarden" , "Vale" , "iron islands" , "essos" ,"andalos"]
let printValue = place.map{$0}
print(printValue)

//: the printed values have optionals among it where this can be avoided using flatmap
let flatMapValue = place.flatMap{$0}
print(flatMapValue)  // here the optionals are removed

//: flat map is also used to filter out the nil value
let arrayWithNil:[String?] = ["eleven" , nil , "demogorgon" , nil , "max" , nil , "lucus" , nil , "dustin"]
let filterNilArray = arrayWithNil.flatMap{$0}
print(filterNilArray)
print ("Array with nil = \(arrayWithNil.count) and with out nil count = \(filterNilArray.count)")

//: flatmap will come in handy when you need check on nil or working on optional type like below
let gradeArray:[String] = ["45" , "60" , "75" , "something random error" , "15" , "Another Error"]
let gradeActualArray:[Int] = gradeArray.flatMap{Int($0)}
print(gradeActualArray)

//: ### Using filter()
//: ## filter is used to select the expected item based on condition.

let numbers = Array(1...100)
let evenNumbers = numbers.filter{ $0%2 == 0}
print(evenNumbers)

let name:[String] = ["jon snow" , "Arya Stark" , "Jamie Lanniester" , "Sansa Stark" , "Renly Barathon" , "Catelen Stark" ,"Theon Grayjoy" ,"Ned Stark"]
let starkFamily = name.filter{$0.hasSuffix("Stark")}
print(starkFamily)

let arrayWith_min_10_char = name.filter{ $0.count > 10}
print(arrayWith_min_10_char)
//: ### Using sorted()
//: ## sorted is used to rearrange the elements in the Array

let randomNumbers:[Int] = [1 ,3,45,6743,4673,435,4162,6657,2431,658,686,56,3456,8875,325,46,2,66537,6]
print(randomNumbers)

//: simple sorting of the number
let sortednumber = randomNumbers.sorted()
print(sortednumber)

//: sorting of the string
let alphabets:[Character] = ["V" ,"I" ,"S" , "H" ,"W" ,"A" ,"S" , "v" ,"i" ,"s" ,"h" , "w" ,"a" ,"s"]
let sortedAlphabets = alphabets.sorted()
print(sortedAlphabets)

let evenFirstSorted = randomNumbers.sorted { (a, b) -> Bool in
    return a % 2 == 0
}
print(evenFirstSorted)

//: sorting can be done based on < ,>
let greaterThanArray = randomNumbers.sorted(by: >)
let lesserThanArray = randomNumbers.sorted(by: <)
print(greaterThanArray)
print(lesserThanArray)

//: ### Using reduce()
//: ## reduce is used to combine all element in Array to make one single value

let sumOfNumbers = numbers.reduce(0,{$0 + $1})
print(sumOfNumbers)

let stringOfNumbers = numbers.reduce("", {String($0) + String($1)})
print(stringOfNumbers)

//: count all the characters in a array
let nameArrayCharactersCount = name.reduce(0, {$0 + $1.count})
print(nameArrayCharactersCount)

//: all names into one string
let nameString = name.reduce("", {$0 + $1.replacingOccurrences(of: " ", with: "")})
print("type of name :- \(type(of: name)) , type of nameString :-  \(type(of: nameString))")
//: Find Longest Name
let longestname = name.reduce("", {$0.count > $1.count ? $0 : $1 } )
print(longestname)
