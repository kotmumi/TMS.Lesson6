// MARK: -1.  Хранить информацию о студентах: Для каждого студента необходимо хранить следующую информацию:
//*   Имя (String)
//*   Возраст (Int)
//*   Оценки по предметам (Dictionary, где ключ - название предмета (String), значение - оценка (Int))
//*   Набор (Set) посещенных факультативов (String)

//Используйте кортеж для представления данных об одном студенте: (name: String, age: Int, grades: [String: Double], optionalSubjects: Set<String>)

typealias Student = (name: String, age: Int, grades: [String: Double], optionalSubjects: Set<String>)

// MARK: -2.  Создать массив студентов: Создайте массив, содержащий данные о нескольких студентах (минимум 5).
enum Name: String, CaseIterable {
    case Alex = "Ales"
    case Ivan = "Ivan"
    case Kirill = "Kirill"
    case Leonid = "Leonid"
    case Pavel = "Pavel"
    case Serhii = "Serhii"
    case Vladimer = "Vladimer"
    case Yaroslav = "Yaroslav"
    case Andrii = "Andrii"
}

enum Subjects: String, CaseIterable{
    case math = "Math"
    case english = "English"
    case history = "History"
    case physics = "Physics"
    case chemistry = "Chemistry"
    case biology = "Biology"
    case computerScience = "Computer Science"
    case french = "French"
    case art = "Art"
    }
