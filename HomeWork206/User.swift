import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "King",
            password: "12345",
            person: Person.getPersonData()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let age: String
    let work: String
    let bio: Bio
        
    static func getPersonData() -> Person {
        Person(
            name: "Alex",
            surname: "Go",
            age: "40",
            work: "RANEPA",
            bio: Bio.getBioData()
        )
    }
}

struct Bio {
    let bio: String
    
    static func getBioData() -> Bio {
        Bio(
            bio: "Я, просто Я!"
        )
    }
}
