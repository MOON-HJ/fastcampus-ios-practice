//  1. 강의 이름, 강사 이름, 학생 수를 가지는 struct 만들기 (Lecture)
struct Lecture {
    var name: String
    var instructor: String
    var studentsCount : Int
}

//  2. 강의 Array와 강사이름을 받아서, 해당 강사의 강의 이름을 출력하는 함수 만들기

//  func printLectureName(from instructor:String, lectures:[Lecture]) {
//      lectures.forEach{ i in
//          if i.instructor == instructor {
//              print(i.name)
//          }
//      }
//  }

func printLectureName(from instructor:String, lectures:[Lecture]) {
    print(lectures.first{$0.instructor == instructor}?.name ?? "")
}

//  3. 강의 3개 만들고 강사이름으로 강의찾기
let lectures:[Lecture] = [Lecture(name: "a", instructor: "aaa", studentsCount: 1),
                          Lecture(name: "b", instructor: "bbb", studentsCount: 2),
                          Lecture(name: "c", instructor: "ccc", studentsCount: 3)]

printLectureName(from: "ddd", lectures: lectures)

