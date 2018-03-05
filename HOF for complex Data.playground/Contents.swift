//: # This playGround examples Explains how the comparable Protocal can be used with HigherOrderFunctions

import UIKit

//: Lets say we have employee data/Struct with their name age and salary details
struct Employee
{
    var name:String
    var age:Int
    var salary:Double
}

//: lets create employees and add then to the group that is Array
let employee1:Employee = Employee(name: "Jhon", age: 28, salary: 15000)
let employee2:Employee = Employee(name: "Harry", age: 30, salary: 12500)
let employee3:Employee = Employee(name: "Tom", age: 24, salary: 17500)
let employee4:Employee = Employee(name: "Smith", age: 40, salary: 22750)
let employee5:Employee = Employee(name: "Alex", age: 21
    , salary: 8300)

let employeeArray:[Employee] = [employee1,employee2,employee3,employee4,employee5]

//: In case of any real time Data you need pirticualar information at a time , So lets say you need all employee data who has salary above 15000
let salary = employeeArray.filter{$0.salary >= 15000}

//: Lets verify if we have filtered Correctly using HOF to Print same
salary.flatMap{print("salary: \($0.salary)")}

//:  Another Senario where we need to sort employees by age
let ageOrdered = employeeArray.sorted { (a, b) -> Bool in
    return a.age > b.age
}
//: Print ageOrdered Collection
ageOrdered.flatMap{print(" age: \($0.age)")}


//: If there is a date base then there should obviously be search option , So lets create a employee and search if he is present in our collection
let employeeX:Employee = Employee(name: "Alex", age: 21
    , salary: 8300)
// UnComment this code to see Error

/*employeeArray.filter { (e) -> Bool in
    e == employeeX
}*/

//: When above code is executed we get error because compiler doesnt know what to compare nor the implementation is done for the same

//: # Implementing Employee with Comparable Portable
struct Employee2:Comparable
{
    var name:String
    var age:Int
    var salary:Double
    
    init(name: String? = nil, //👈
        age: Int? = nil,
        salary: Double? = 0) {
        
        self.name = name!
        self.age = age!
        self.salary = salary!
    }
    //: Below are the function which define comparators
    static func <(lhs: Employee2, rhs: Employee2) -> Bool {
        return lhs.salary < rhs.salary
    }
    
    static func ==(lhs: Employee2, rhs: Employee2) -> Bool {
        return  lhs.salary == rhs.salary
    }
    
    static func ===(lhs: Employee2, rhs: Employee2) -> Bool {
        return  (lhs.name == rhs.name) && (lhs.age == rhs.age)
    }
    
    static func age(lhs: Employee2, rhs: Employee2) -> Bool {
        return  lhs.age < rhs.age
    }
}

let emp:Employee2 = Employee2.init(name: "sh", age: 20)
print(emp)


let employee11:Employee2 = Employee2(name: "Jhon", age: 28, salary: 15000)
let employee21:Employee2 = Employee2(name: "Harry", age: 30, salary: 12500)
let employee31:Employee2 = Employee2(name: "Tom", age: 24, salary: 17500)
let employee41:Employee2 = Employee2(name: "Smith", age: 40, salary: 22750)
let employee51:Employee2 = Employee2(name: "Alex", age: 21
    , salary: 8300)


let employeeArrayWithComparableProtocal:[Employee2] = [employee11,employee21,employee31,employee41,employee51]

//: Here the employeeArrayWithComparableProtocal is sorted based on salary if you observe we have already sorthed based on age
//: So here what made difference is we no need to specify any property which needed to sort
let salaryOrdered_ = employeeArrayWithComparableProtocal.sorted { (a, b) -> Bool in
    return a > b
}

//: So now lets go back to search we were talking before
let employeeXC:Employee2 = Employee2(name: "Jhon", age: 28)
let searchedEmployee = employeeArrayWithComparableProtocal.filter{$0 === employeeXC}
print(searchedEmployee)

//: Here in above we created employee with name and age we got back his salary details


//: if employee has to be sorted by any other means or by property it can be assigned and used as below
let ageOrdered_ = employeeArrayWithComparableProtocal.sorted { (a, b) -> Bool in
    return Employee2.age(lhs: a, rhs: b)
}
ageOrdered_.flatMap{print("age: \($0.age), salary: \($0.salary)")}
