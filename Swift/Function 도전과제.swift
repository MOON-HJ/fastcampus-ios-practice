import UIKit

// 1. 성, 이름을 받아서 fullname을 출력하는 함수 만들기
func printFullname(firstName: String, lastName: String) {
    print(firstName+" "+lastName)
}
printFullname(firstName: "Jason", lastName: "Lee") // Jason Lee

// 2. 1번에서 만든 함수인데, 파라미터 이름을 제거하고 fullname을 출력하는 함수 만들기
func printFullname(_ firstName: String, _ lastName: String) {
    print(firstName+" "+lastName)
}
printFullname("Jason", "Lee") // Jason Lee

// 3. 성, 이름을 받아서 fullname return 하는 함수 만들기
func fullName(_ firstName: String, _ lastName: String) -> String{
    return firstName+" "+lastName
}
let name = fullName("Jason", "Lee")
name
