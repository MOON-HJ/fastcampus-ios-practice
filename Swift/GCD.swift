import UIKit

// 1. Queue - Main, Global, Custom
// 1.1 Queue.main
DispatchQueue.main.async {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
}

// 1.2 Queue.global
DispatchQueue.global(qos: .userInteractive).async {
    // 지금당장 해야하는 것
}
DispatchQueue.global(qos: .userInitiated).async {
    // 사용자가 결과를 기다림
}
DispatchQueue.global(qos: .default).async {
    //
}
DispatchQueue.global(qos: .utility).async{
    // 시간이 좀 걸리는 일들
}
DispatchQueue.global(qos: .background).async {
    // 파일 다운로드, 뉴스 데이터 미리 다운받기
}

// 1.3 Custom Queue
let concurrentQueue = DispatchQueue(label: "concurrent", qos :.background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)


// 2. 복합적인 상황
func downloadImageFromServer() -> UIImage {
    return UIImage()
}

func updateUI(image: UIImage) {}

DispatchQueue.global(qos: .background).async{
    let image = downloadImageFromServer()
    DispatchQueue.main.async {
        updateUI(image: image)
    }
}

// 3. Sync, Async
DispatchQueue.global(qos:.background).sync{
    (0...5).forEach{print("🔴 \($0)")}
}
DispatchQueue.global(qos:.background).async{
    (0...5).forEach{print("🔵 \($0)")}
}
