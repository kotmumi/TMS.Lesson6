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
    for index in 0...Int.random(in: 0...6) {
        let randomGrade = Double(Int.random(in: 0...10)) / 2.0
        grades[Subjects.allCases.randomElement()!.rawValue] = randomGrade == 0.0 ? nil : randomGrade
        
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
print("Total count students: \(studentList.count) \n ---------------------------")
studentList.forEach() {
    print("Name: \($0.name)")
    print("Age: \($0.age)")
    print ("Grades: \($0.grades)")
    print ("OptionalSubject: \($0.optionalSubjects)\n")
}

// MARK: -3.  Реализовать функции для обработки данных:
//*   calculateAverageGrade(student: Student) -> Double?: Функция должна принимать кортеж студента и возвращать его средний балл по всем предметам. Если у студента нет оценок, функция должна вернуть nil.

func calculateAverageGrade(student: Student) -> Double? {
    guard !student.grades.isEmpty else {
        return nil
    }
    return student.grades.values.reduce(0, +) / Double(student.grades.count)
}

// MARK: -Test
studentList.forEach {
    if let averageGrade = calculateAverageGrade(student: $0) {
        print("Average grade for \($0.name) is: \(averageGrade)")
    } else {
        print("\($0.name) has no grade")
    }
}

//*   findStudentsByAge(students: [Student], age: Int) -> [Student]: Функция должна принимать массив студентов и возраст, и возвращать новый массив, содержащий только студентов указанного возраста. Используйте функцию высшего порядка filter.

func findStudentsByAge(students: [Student], age: Int) -> [Student] {
    return students.filter { $0.age == age }
}

// MARK: -Test
let student22AgeList = findStudentsByAge(students: studentList, age: 22)
print("\nStudents 22 age:")
student22AgeList.forEach { print("\($0.name) is \($0.age) years old") }
