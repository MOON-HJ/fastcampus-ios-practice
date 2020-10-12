//  1. 이름, 직업, 도시에 대해서 본인의 딕셔너리 만들기
var moon:[String: String] = ["name":"moon", "job":"developer", "city":"seoul"]

//  2. 여기서 도시를 부산으로 업데이트 하기
moon["city"] = "busan"
moon

//  3. 딕셔너리를 받아서 이름과 도시 프린트하는 함수 만들기
func printNameAndCity(_ person:[String:String]) {
    guard let name = person["name"], let city = person["city"] else {
        return
    }
    print("이름 = \(name), 도시 = \(city)")
}
printNameAndCity(moon)
