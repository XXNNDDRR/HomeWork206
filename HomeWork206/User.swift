import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "King",
            password: "12345",
            person: Person(name: "Alex", surname: "Go")
        )
    }
}

struct Person {
    let name: String
    let surname: String
    
    var fullName: String {"\(name) \(surname)"}
}
