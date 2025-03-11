import Foundation

// MARK: -1.  Хранить информацию о студентах: Для каждого студента необходимо хранить следующую информацию:
//*   Имя (String)
//*   Возраст (Int)
//*   Оценки по предметам (Dictionary, где ключ - название предмета (String), значение - оценка (Int))
//*   Набор (Set) посещенных факультативов (String)

//Используйте кортеж для представления данных об одном студенте: (name: String, age: Int, grades: [String: Double], optionalSubjects: Set<String>)

typealias Student = (name: String, age: Int, grades: [String: Double], optionalSubjects: Set<String>)

// MARK: -2.  Создать массив студентов: Создайте массив, содержащий данные о нескольких студентах (минимум 5).

enum Name: String, CaseIterable {
    case Alex = "Alex"
    case Ivan = "Ivan"
    case Kirill = "Kirill"
    case Leonid = "Leonid"
    case Pavel = "Pavel"
    case Serhii = "Serhii"
    case Vladimer = "Vladimer"
    case Yaroslav = "Yaroslav"
    case Andrii = "Andrii"
}

enum Subjects: String, CaseIterable {
    case math = "Math"
    case english = "English"
    case history = "History"
    case physics = "Physics"
    case chemistry = "Chemistry"
    case biology = "Biology"
}

enum OptionalSubjects: String, CaseIterable {
    case music = "Music"
    case french = "French"
    case art = "Art"
    case computerScience = "Computer Science"
}

func randomGrades() -> [String: Double] {
    var grades: [String: Double] = [:]
    for index in 0...Int.random(in: 1...6) {
        grades[Subjects.allCases.randomElement()!.rawValue] = Double(Int.random(in: 2...10)) / 2.0
    }
    return grades
}

func randomOptionalSubject() -> Set<String> {
    var optSubject: Set<String> = []
    for index in 0...Int.random(in: 1...3) {
        let randomSubject = OptionalSubjects.allCases.randomElement()!.rawValue
        if optSubject.contains(randomSubject) == false {
            optSubject.insert(randomSubject)
        }
    }
    return optSubject
}

var studentList: [Student] = []

for i in 0...Int.random(in: 4...9) {
    
    let studentName = Name.allCases.randomElement()!.rawValue
    let age = Int.random(in: 18...25)
    
    studentList.append((studentName, age, randomGrades(), randomOptionalSubject()))
}
// MARK: -Test
print("Общее количество студентов: \(studentList.count) \n ---------------------------")
studentList.forEach() {
    print("Name: \($0.name)")
    print("Age: \($0.age)")
    print ("Grades: \($0.grades)")
    print ("OptionalSubject: \($0.optionalSubjects)\n")
}


