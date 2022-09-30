import UIKit
//
////MARK: Closure
//func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//    completionHandler()
//}
//
//
//func someFunctionWithNonescapingClosure(closure: () -> Void) {
//    closure()
//}
//
//class SomeStruct {
//    var x = 10
//    func doSomething() {
////        someFunctionWithNonescapingClosure { x = 200 }
//
//        x = 200
//
//
//        someFunctionWithEscapingClosure {
//            self.x = 100
//        }
//    }
//}

//func loadPicture(from server: String?, completion: (String) -> Void, onFailure: () -> Void) {
//    if let picture = server {
//        completion(picture)
//    } else {
//        onFailure()
//    }
//}
////
//loadPicture(from: "213") { picture in
//    let currentPicture = picture
//    print(currentPicture)
//} onFailure: {
//    print("Couldn't download the next picture.")
//}
//

//var customerProviders: [() -> String] = []
//var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
//    customerProviders.append(customerProvider)
//}
//collectCustomerProviders(customersInLine.remove(at: 0))
//collectCustomerProviders(customersInLine.remove(at: 0))
////collectCustomerProviders {
////     customersInLine.remove(at: 0)
////
////}
////collectCustomerProviders {
////     customersInLine.remove(at: 0)
////
////}
//print("Collected \(customerProviders.count) closures.")
//// Prints "Collected 2 closures."
//for customerProvider in customerProviders {
//    print("Now serving \(customerProvider())!")
//}
//
//
////MARK: Optional
//
////String? might be nil or might be a string, and String! might be nil but when you use it you’re absolutely sure it has a string.
//
//func printName(humanName: String){
//        print(humanName)
//}
//class Human {
//    var name: String!
//    var age: String?
//}
//
//var human1 = Human()
//human1.name = "minh"
//human1.age = "12"
//
//var human2 = Human()
//human2.name = human1.name
//
//printName(humanName: human1.age!)
//printName(humanName: human1.name)
//
//printName(humanName: human2.name)
//printName(humanName: human2.age ?? "13")
//
////MARK: Protocol
//
//protocol FullyNamed {
//    var fullName: String { get }
//    func someTypeMethod()
//}
//protocol NickName: FullyNamed {
//    var nickname: String { get }
//}
//struct Person: NickName {
//    var nickname: String
//
//    func someTypeMethod() {
//        print("minh")
//    }
//    var fullName: String
//}
//
//let minh = Person(nickname: "minh", fullName: "minhdtn")
//minh.someTypeMethod()

//Struct vs Class
struct UserStruct {
    var name: String
    var phoneNumber: String
    
}
class UserClass {
    var name: String
    var phoneNumber: String
    init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
}
let user1 = UserStruct(name: "me hao", phoneNumber: "21312321321")
//user1.name = "bo cong"
var user3 = user1
user3.name = "bo cong"
let user2 = UserClass(name: "minh", phoneNumber: "0123456789")
user2.name = "Anh"
let user4 = user2
user4.phoneNumber = "13"
print(user3)
print("\(user4.name) \(user2.phoneNumber)")

