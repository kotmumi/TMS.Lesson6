// MARK: -1.  Хранить информацию о студентах: Для каждого студента необходимо хранить следующую информацию:
//*   Имя (String)
//*   Возраст (Int)
//*   Оценки по предметам (Dictionary, где ключ - название предмета (String), значение - оценка (Int))
//*   Набор (Set) посещенных факультативов (String)

//Используйте кортеж для представления данных об одном студенте: (name: String, age: Int, grades: [String: Double], optionalSubjects: Set<String>)

typealias Student = (name: String, age: Int, grades: [String: Double], optionalSubjects: Set<String>)
