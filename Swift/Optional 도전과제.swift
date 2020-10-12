//  1. 최애 음식이름을 담는 변수를 작성 (String?)
var favoriteFood:String? = "Chicken"

//  2. 옵셔널 바인딩을 이용해서 값을 확인해보기
if let unwrappedFavoriteFood = favoriteFood {
    print(unwrappedFavoriteFood)
} else {
    print("최애 음식 없음")
}

//  3. 닉네임을 받아서 출력하는 함수 만들기, 조건 입력 파라미터는 String?
func printNickName(nickname: String?) {
    guard let unwrappedNickname = nickname else {
        print("nickname 없음")
        return
    }
    print(unwrappedNickname)
}

printNickName(nickname: "hello")
printNickName(nickname: nil)
